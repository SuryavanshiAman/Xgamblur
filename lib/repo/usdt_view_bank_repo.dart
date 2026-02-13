import 'package:flutter/foundation.dart';
import 'package:bettsix/helper/network/base_api_services.dart';
import 'package:bettsix/helper/network/network_api_services.dart';
import 'package:bettsix/model/usdt_view_bank_model.dart';
import 'package:bettsix/model/view_bank_model.dart';
import 'package:bettsix/res/api_url.dart';

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