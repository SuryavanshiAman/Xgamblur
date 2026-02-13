import 'package:flutter/foundation.dart';
import 'package:bettsix/helper/network/base_api_services.dart';
import 'package:bettsix/helper/network/network_api_services.dart';
import 'package:bettsix/model/gift_history_model.dart';
import 'package:bettsix/model/profile_model.dart';
import 'package:bettsix/res/api_url.dart';

class GiftHistoryRepo {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<GiftHistoryModel> giftHistoryApi(dynamic data) async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(
          "${ApiUrl.giftHistoryApi}$data");
      return GiftHistoryModel.fromJson(response);
    } catch (e) {
      if (kDebugMode){
        print('Error occurred during giftHistoryApi: $e');
      }
      rethrow;
    }
  }

}