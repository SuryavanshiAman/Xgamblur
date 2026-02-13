import 'package:flutter/foundation.dart';
import 'package:bettsix/helper/network/base_api_services.dart';
import 'package:bettsix/helper/network/network_api_services.dart';
import 'package:bettsix/model/palyment_limit_model.dart';
import 'package:bettsix/model/profile_model.dart';
import 'package:bettsix/res/api_url.dart';

class PaymentLimitRepo {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<PaymentLimitsModel> paymentLimitApi() async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(ApiUrl.paymentLimitApi);
      return PaymentLimitsModel.fromJson(response);
    } catch (e) {
      if (kDebugMode){
        print('Error occurred during paymentLimitApi: $e');
      }
      rethrow;
    }
  }

}