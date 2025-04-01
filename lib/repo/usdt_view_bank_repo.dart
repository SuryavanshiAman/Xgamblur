import 'package:flutter/foundation.dart';
import 'package:xgamblur/helper/network/base_api_services.dart';
import 'package:xgamblur/helper/network/network_api_services.dart';
import 'package:xgamblur/model/usdt_view_bank_model.dart';
import 'package:xgamblur/model/view_bank_model.dart';
import 'package:xgamblur/res/api_url.dart';

class USdtViewBankRepo {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<UsdtViewBankModel> usdtViewBankApi(dynamic data) async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(
          "${ApiUrl.viewUserUsdtAddressApi}$data");
      return UsdtViewBankModel.fromJson(response);
    } catch (e) {
      if (kDebugMode){
        print('Error occurred during usdtViewBankApi: $e');
      }
      rethrow;
    }
  }

}