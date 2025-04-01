import 'package:flutter/foundation.dart';
import 'package:xgamblur/helper/network/base_api_services.dart';
import 'package:xgamblur/helper/network/network_api_services.dart';
import 'package:xgamblur/model/deposit_model.dart';
import 'package:xgamblur/model/profile_model.dart';
import 'package:xgamblur/res/api_url.dart';

class DepositHistoryRepo {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<DepositModel> depositHistoryApi(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(ApiUrl.depositHistoryApi,data);
      return DepositModel.fromJson(response);
    } catch (e) {
      if (kDebugMode){
        print('Error occurred during depositHistoryApi: $e');
      }
      rethrow;
    }
  }

}