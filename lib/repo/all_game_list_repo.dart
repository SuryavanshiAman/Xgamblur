import 'package:flutter/foundation.dart';
import 'package:xgamblur/helper/network/base_api_services.dart';
import 'package:xgamblur/helper/network/network_api_services.dart';
import 'package:xgamblur/model/all_game_list_model.dart';
import 'package:xgamblur/res/api_url.dart';

class AllGameListRepo {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<AllGameListModel> allGameListApi() async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(ApiUrl.allGameList,"");
      return AllGameListModel.fromJson(response);
    } catch (e) {
      if (kDebugMode){
        print('Error occurred during allGameListApi: $e');
      }
      rethrow;
    }
  }

}