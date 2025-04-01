import 'package:flutter/foundation.dart';
import 'package:xgamblur/helper/network/base_api_services.dart';
import 'package:xgamblur/helper/network/network_api_services.dart';
import 'package:xgamblur/model/profile_model.dart';
import 'package:xgamblur/res/api_url.dart';

class UserProfileRepository {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<ProfileModel> userProfileApi(dynamic data) async {
    try {
      dynamic response = await _apiServices.getGetApiResponse(
          "${ApiUrl.profileApi}$data");
      return ProfileModel.fromJson(response);
    } catch (e) {
      if (kDebugMode){
        print('Error occurred during userProfileApi: $e');
      }
      rethrow;
    }
  }

}