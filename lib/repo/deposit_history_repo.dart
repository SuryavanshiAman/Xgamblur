import 'package:flutter/foundation.dart';
import 'package:bettsix/helper/network/base_api_services.dart';
import 'package:bettsix/helper/network/network_api_services.dart';
import 'package:bettsix/model/deposit_model.dart';
import 'package:bettsix/model/profile_model.dart';
import 'package:bettsix/res/api_url.dart';

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