import 'package:flutter/foundation.dart';
import 'package:xgamblur/helper/network/base_api_services.dart';
import 'package:xgamblur/helper/network/network_api_services.dart';
import 'package:xgamblur/model/profile_model.dart';
import 'package:xgamblur/model/view_bank_model.dart';
import 'package:xgamblur/res/api_url.dart';

class ViewBankRepo {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<ViewBankModel> viewBankApi(dynamic data) async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(
          "${ApiUrl.viewBankApi}$data");
      return ViewBankModel.fromJson(response);
    } catch (e) {
      if (kDebugMode){
        print('Error occurred during viewBankApi: $e');
      }
      rethrow;
    }
  }

}