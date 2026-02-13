import 'dart:convert';
import 'dart:io';
import 'package:flame_forge2d/flame_forge2d.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:bettsix/Plinko/my_game.dart';

import 'package:bettsix/plinko/lesson_02/objects/ball_dynamic.dart';
import 'package:http/http.dart' as http;
import 'package:bettsix/plinko/modal/plinko_bet_history.dart';
import 'package:bettsix/plinko/utils/plinko_loss_popup.dart';
import 'package:bettsix/plinko/utils/plinko_win_popup.dart';
import 'package:flutter/material.dart';
import 'package:flame/extensions.dart';
import 'package:bettsix/res/api_url.dart';
import 'dart:ui' as ui;

import 'package:bettsix/view_model/user_view_model.dart';





class FloorStatic extends BodyComponent with ContactCallbacks {
  final Color color;
  late final Paint _paint;

  FloorStatic({this.color = Colors.transparent}) {
    _paint = Paint()..color = color;
  }

  @override
  Body createBody() {
    final bodyDef = BodyDef(
      userData: this,
      position: Vector2(0, worldSize.y - .75),
      type: BodyType.static,
    );

    final shape = EdgeShape()
      // ..set(Vector2.zero(), Vector2(0, 0));
      ..set(Vector2.zero(), Vector2(worldSize.x, 0));
    final fixtureDef = FixtureDef(shape);
    return world.createBody(bodyDef)
      ..createFixture(fixtureDef);
  }

  @override
  void render(ui.Canvas canvas) {
    super.render(canvas);
    final rect = Rect.fromLTWH(0, worldSize.y - .75, worldSize.x, 0.75);
    canvas.drawRect(rect, _paint);
  }

  @override
  void beginContact(Object other, Contact contact) {
    if (other is BallDynamic) {
      final contactPoint = contact.manifold.localPoint;

      final ballPositions = contact.bodyB.position;
      final ballPosition = ballPositions.x;

      plinkoBet(ballPosition);
    }
  }

  @override
  void endContact(Object other, Contact contact) {
    if (other is BallDynamic) {
    }
  }

  int generateScore(double pos, int old) {
    return old;
  }


  String processBallPosition(double ballPosition) {
    if (ballPosition >= 1.0 && ballPosition <= 2.42) {
      return '0';
    } else if (ballPosition > 2.42 && ballPosition <= 3.84) {
      return '1';
    } else {
      return '2';
    }
  }

  String SetIndex = '';

  plinkoBet(double ballPosition) async {
    UserViewModel userViewModal = UserViewModel();
    String? userId = await userViewModal.getUser();

    if (ballPosition >= 1.0 && ballPosition <= 2.42) {
      SetIndex = '1';
    } else
      if (ballPosition > 2.42 && ballPosition <= 3.84) {
      SetIndex = '2';
    } else if (ballPosition > 3.84 && ballPosition <= 5.26) {
      SetIndex = '3';
    } else if (ballPosition > 5.26 && ballPosition <= 6.68) {
      SetIndex = '4';
    } else if (ballPosition > 6.68 && ballPosition <= 8.1) {
      SetIndex = '5';
    } else if (ballPosition > 8.1 && ballPosition <= 9.52) {
      SetIndex = '6';
    } else if (ballPosition > 9.52 && ballPosition <= 10.94) {
      SetIndex = '7';
    } else if (ballPosition > 10.94 && ballPosition <= 12.36) {
      SetIndex = '8';
    } else if (ballPosition > 12.36) {
      SetIndex = '9';
    }
    //   else if (ballPosition > 1.0) {
    //   SetIndex = '9';
    // }


    final response = await http.post(
      Uri.parse(ApiUrl.plinkoMultiplier),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{"userid": userId.toString(), "index": SetIndex}),
    );
print("Tanisha");
print(ApiUrl.plinkoMultiplier);
print({"userid": userId.toString(), "index": SetIndex});
    print("✌️✌️✌️✌️");
    if (response.statusCode == 200) {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      fetchPlinkoData();
      // fetchPlinkoBet();
      return Fluttertoast.showToast(msg: responseData['message']);
    } else {
      final Map<String, dynamic> responseData = jsonDecode(response.body);
      return Fluttertoast.showToast(msg: responseData['message']);
    }
  }

  dynamic type;
  dynamic multipler;
  dynamic win_amount;

  Future<List<PlinkoBetHistory>?> fetchPlinkoBet() async {
    UserViewModel userViewModal = UserViewModel();
    String? userId = await userViewModal.getUser();
    try {
      final response = await http.get(Uri.parse("${ApiUrl.plinkoBetHistory}$userId&limit=1")).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {

        final jsonList = json.decode(response.body);
        if (jsonList['status'] == 200) {
          final List<dynamic> data = json.decode(response.body)['data'];
          if (data.isNotEmpty) {
            type = data[0]['type'].toString();
            multipler = data[0]['multipler'].toString();
            win_amount = data[0]['win_amount'].toString();
          }


print(type);
print(win_amount);
print(win_amount);
print("Poopat");
          List<PlinkoBetHistory> plinkolist = data.map((jsonMap) => PlinkoBetHistory.fromJson(jsonMap)).toList();
          if (win_amount != "0"){
            ToastHelper.showwin(subtext1: type, subtext2: win_amount);
          }else{
            ToastLostHelper.showloss(subtext1: type, subtext2: win_amount);
          }
          return plinkolist;
        } else {
          return null;
        }
      } else {
        throw Exception('Failed to load data');
      }
    } on SocketException {
      throw Exception('No Internet connection');
    }
  }

  Future<void> fetchPlinkoData() async {
    try {
      List<PlinkoBetHistory>? plinkoBetData = await fetchPlinkoBet();
      if (kDebugMode) {
        print(plinkoBetData);
        print("plinkoBetData");
      }
    } catch (error) {
    }
  }

}


