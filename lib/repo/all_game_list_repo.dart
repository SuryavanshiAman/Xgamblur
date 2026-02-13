import 'package:flutter/foundation.dart';
import 'package:bettsix/helper/network/base_api_services.dart';
import 'package:bettsix/helper/network/network_api_services.dart';
import 'package:bettsix/model/all_game_list_model.dart';
import 'package:bettsix/res/api_url.dart';

class AllGameListRepo {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<AllGameListModel> allGameListApi() async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(ApiUrl.allGameList);
      return AllGameListModel.fromJson(response);
    } catch (e) {
      if (kDebugMode){
        print('Error occurred during allGameListApi: $e');
      }
      rethrow;
    }
  }

}