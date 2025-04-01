import 'package:flutter/foundation.dart';
import 'package:xgamblur/helper/network/base_api_services.dart';
import 'package:xgamblur/helper/network/network_api_services.dart';
import 'package:xgamblur/model/avtar_model.dart';
import 'package:xgamblur/res/api_url.dart';

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