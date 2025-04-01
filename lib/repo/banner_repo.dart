import 'package:flutter/foundation.dart';
import 'package:xgamblur/helper/network/base_api_services.dart';
import 'package:xgamblur/helper/network/network_api_services.dart';
import 'package:xgamblur/model/banner_model.dart';

import '../res/api_url.dart';

class BannerRepository {
  final BaseApiServices _apiServices = NetworkApiServices();
  Future<BannerModel> bannerApi() async {
    try {
      dynamic response =
      await _apiServices.getGetApiResponse(ApiUrl.bannerApi);
      return BannerModel.fromJson(response);
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during bannerApi: $e');
      }
      rethrow;
    }
  }
}