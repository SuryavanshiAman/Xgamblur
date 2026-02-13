import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:bettsix/model/usdt_view_bank_model.dart';
import 'package:bettsix/model/view_bank_model.dart';
import 'package:bettsix/repo/usdt_view_bank_repo.dart';
import 'package:bettsix/repo/view_bank_repo.dart';
import 'package:bettsix/view_model/user_view_model.dart';

class USdtViewBankViewModel with ChangeNotifier {
  final _usdtViewBankRepo = USdtViewBankRepo();


  UsdtViewBankModel? _usdtBankData;
  UsdtViewBankModel? get usdtBankData => _usdtBankData;

  setBankData(UsdtViewBankModel value) {
    _usdtBankData = value;
    notifyListeners();
  }

  Future<void> usdtBankViewApi(context) async {
    UserViewModel userViewModal = UserViewModel();
    String? userId = await userViewModal.getUser();
    _usdtViewBankRepo.usdtViewBankApi(userId).then((value) {
      if (value.status == 200) {
        setBankData(value);
      } else {
        setBankData(value);
        if (kDebugMode) {
        }
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print('usdtBankViewApi: $error');
      }
    });
  }
}

