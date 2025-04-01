import 'package:flutter/foundation.dart';
import 'package:xgamblur/helper/network/base_api_services.dart';
import 'package:xgamblur/helper/network/network_api_services.dart';
import 'package:xgamblur/model/notification_model.dart';
import 'package:xgamblur/res/api_url.dart';

class NotificationRepo {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<NotificationModel> notificationApi() async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(ApiUrl.notificationApi);
      return NotificationModel.fromJson(response);
    } catch (e) {
      if (kDebugMode){
        print('Error occurred during notificationApi: $e');
      }
      rethrow;
    }
  }

}