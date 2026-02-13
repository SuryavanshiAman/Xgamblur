import 'package:flutter/foundation.dart';
import 'package:bettsix/helper/network/base_api_services.dart';
import 'package:bettsix/helper/network/network_api_services.dart';
import 'package:bettsix/res/api_url.dart';

import '../model/win_amount_model.dart';
class WinGoPopUpRepository {
  final BaseApiServices _apiServices = NetworkApiServices();
  Future<WinAmountModel> winAmountApi(
      dynamic userId, String gameId, dynamic period) async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(
          "${ApiUrl.wingoWinAmount}$userId&game_id=$gameId&games_no=$period");
      print(ApiUrl.wingoWinAmount);
      print("${ApiUrl.wingoWinAmount}$userId&game_id=$gameId&games_no=$period");
      return WinAmountModel.fromJson(response);
    } catch (e) {
      if (kDebugMode) {
        print('Error occurred during winAmountApi: $e');
      }
      rethrow;
    }
  }
}
