import 'package:flutter/foundation.dart';
import 'package:bettsix/helper/network/base_api_services.dart';
import 'package:bettsix/helper/network/network_api_services.dart';
import 'package:bettsix/model/customer_service_model.dart';
import 'package:bettsix/model/profile_model.dart';
import 'package:bettsix/res/api_url.dart';

class CustomerServiceRepo {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<CustomerServiceModel> customerServiceApi() async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(ApiUrl.customerServiceApi);
      return CustomerServiceModel.fromJson(response);
    } catch (e) {
      if (kDebugMode){
        print('Error occurred during customerServiceApi: $e');
      }
      rethrow;
    }
  }

}