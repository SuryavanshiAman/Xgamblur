import 'package:flutter/foundation.dart';
import 'package:xgamblur/helper/network/base_api_services.dart';
import 'package:xgamblur/helper/network/network_api_services.dart';
import 'package:xgamblur/model/transaction_history_model.dart';
import 'package:xgamblur/res/api_url.dart';

class TransactionHistoryRepo {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<TransactionHistoryModel> transactionApi(dynamic data) async {
    try {
      dynamic response = await _apiServices.getPostApiResponse(ApiUrl.transactionApi,data);
      return TransactionHistoryModel.fromJson(response);
    } catch (e) {
      if (kDebugMode){
        print('Error occurred during transactionApi: $e');
      }
      rethrow;
    }
  }

}