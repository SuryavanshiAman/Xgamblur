import 'package:flutter/foundation.dart';
import 'package:xgamblur/helper/network/base_api_services.dart';
import 'package:xgamblur/helper/network/network_api_services.dart';
import 'package:xgamblur/res/api_url.dart';

class WinGoBetRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> wingoBet(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(ApiUrl.wingoBet, data);
      return response;
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during wingoBet: $e');
      }
      rethrow;
    }
  }
}
