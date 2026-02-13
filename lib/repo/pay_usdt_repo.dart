import 'package:flutter/foundation.dart';
import 'package:bettsix/helper/network/base_api_services.dart';
import 'package:bettsix/helper/network/network_api_services.dart';
import 'package:bettsix/model/pay_usdt_model.dart';
import 'package:bettsix/model/profile_model.dart';
import 'package:bettsix/res/api_url.dart';

class PayUsdtRepo {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<PayUsdtModel> payUsdtApi() async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(ApiUrl.payUsdtApi);
      return PayUsdtModel.fromJson(response);
    } catch (e) {
      if (kDebugMode){
        print('Error occurred during payUsdtApi: $e');
      }
      rethrow;
    }
  }

}