import 'package:flutter/foundation.dart';
import 'package:bettsix/helper/network/base_api_services.dart';
import 'package:bettsix/helper/network/network_api_services.dart';
import 'package:bettsix/model/aboutus_model.dart';
import 'package:bettsix/res/api_url.dart';

class AboutUsRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<AboutUSModel> aboutUsApi(dynamic data) async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(
          "${ApiUrl.aboutUsApi}$data");
      return AboutUSModel.fromJson(response);
    } catch (e) {
      if (kDebugMode){
        print('Error occurred during aboutUsApi: $e');
      }
      rethrow;
    }
  }

}