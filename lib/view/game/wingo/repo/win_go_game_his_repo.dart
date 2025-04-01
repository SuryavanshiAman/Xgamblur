import 'package:flutter/foundation.dart';
import 'package:xgamblur/helper/network/base_api_services.dart';
import 'package:xgamblur/helper/network/network_api_services.dart';
import 'package:xgamblur/res/api_url.dart';
import 'package:xgamblur/view/game/wingo/model/win_go_game_his_model.dart';
class WinGoGameHisRepository {
  final BaseApiServices _apiServices = NetworkApiServices();
  Future<WinGoGameHisModel> gameHisApi(context, dynamic gameId,dynamic offset) async {
    try {
      dynamic response = await _apiServices
          .getGetApiResponse("${ApiUrl.winGoGameHis}$gameId&offset=$offset");
      return WinGoGameHisModel.fromJson(response);
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during gameHisApi: $e');
      }
      rethrow;
    }
  }
}
