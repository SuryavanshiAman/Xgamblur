import 'package:flutter/foundation.dart';
import 'package:xgamblur/helper/network/base_api_services.dart';
import 'package:xgamblur/helper/network/network_api_services.dart';
import 'package:xgamblur/res/api_url.dart';
import 'package:xgamblur/view/game/wingo/model/win_go_result_model.dart';
class WinGoResultRepository {
  final BaseApiServices _apiServices = NetworkApiServices();
  Future<WinGoResultModel> gameResultApi(context, dynamic data) async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(ApiUrl.winGoLastResult+data);
      return WinGoResultModel.fromJson(response);
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during gameResultApi: $e');
      }
      rethrow;
    }
  }
}