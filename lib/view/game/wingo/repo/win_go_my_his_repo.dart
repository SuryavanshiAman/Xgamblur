import 'package:flutter/foundation.dart';
import 'package:xgamblur/helper/network/base_api_services.dart';
import 'package:xgamblur/helper/network/network_api_services.dart';
import 'package:xgamblur/res/api_url.dart';
import 'package:xgamblur/view/game/wingo/model/win_go_my_his_model.dart';

class WinGoMyHisRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<WinGoMyHisModel> myBetHisApi(dynamic data) async {
    try {
      dynamic response = await _apiServices
          .getPostApiResponse(ApiUrl.winGoMyBetHis,data);
      return WinGoMyHisModel.fromJson(response);
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during myBetHisApi: $e');
      }
      rethrow;
    }
  }
}
