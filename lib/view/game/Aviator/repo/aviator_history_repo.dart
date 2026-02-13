
import 'package:flutter/foundation.dart';
import 'package:bettsix/helper/network/base_api_services.dart';
import 'package:bettsix/helper/network/network_api_services.dart';
import 'package:bettsix/res/api_url.dart';

import '../model/aviator_history_model.dart';


class AviatorHistoryRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<AviatorHistoryModel> aviatorHistoryApi(dynamic data) async {
    try {
      dynamic response =
      await _apiServices.getPostApiResponse(ApiUrl.aviatorHistory,data);
      return AviatorHistoryModel.fromJson(response);
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during aviatorHistoryApi: $e');
      }
      rethrow;
    }
  }
}