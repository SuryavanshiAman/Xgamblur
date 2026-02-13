import 'package:flutter/foundation.dart';
import 'package:bettsix/helper/network/base_api_services.dart';
import 'package:bettsix/helper/network/network_api_services.dart';
import 'package:bettsix/model/live_notification_model.dart';
import 'package:bettsix/model/profile_model.dart';
import 'package:bettsix/res/api_url.dart';

class LiveNotificationRepo {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<LiveNotificationModel> liveNotificationApi() async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(ApiUrl.liveNotificationApi);
      return LiveNotificationModel.fromJson(response);
    } catch (e) {
      if (kDebugMode){
        print('Error occurred during liveNotificationApi: $e');
      }
      rethrow;
    }
  }

}