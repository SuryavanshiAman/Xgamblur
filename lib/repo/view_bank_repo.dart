import 'package:flutter/foundation.dart';
import 'package:bettsix/helper/network/base_api_services.dart';
import 'package:bettsix/helper/network/network_api_services.dart';
import 'package:bettsix/model/profile_model.dart';
import 'package:bettsix/model/view_bank_model.dart';
import 'package:bettsix/res/api_url.dart';

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