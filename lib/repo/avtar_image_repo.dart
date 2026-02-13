import 'package:flutter/foundation.dart';
import 'package:bettsix/helper/network/base_api_services.dart';
import 'package:bettsix/helper/network/network_api_services.dart';
import 'package:bettsix/model/avtar_model.dart';
import 'package:bettsix/res/api_url.dart';

class AvtarImageRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<AvtarModel> avtarImageApi() async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(ApiUrl.avtarImageApi);
      return AvtarModel.fromJson(response);
    } catch (e) {
      if (kDebugMode){
        print('Error occurred during avtarImageApi: $e');
      }
      rethrow;
    }
  }

}