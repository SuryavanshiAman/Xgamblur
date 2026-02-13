import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:bettsix/generated/assets.dart';
import 'package:bettsix/model/profile_model.dart';
import 'package:bettsix/model/view_bank_model.dart';
import 'package:bettsix/repo/profile_repo.dart';
import 'package:bettsix/repo/view_bank_repo.dart';
import 'package:bettsix/utils/routes/routes_name.dart';
import 'package:bettsix/view_model/user_view_model.dart';
import 'package:iconly/iconly.dart';

class ViewBankViewModel with ChangeNotifier {
  final _viewBankRepo = ViewBankRepo();


  ViewBankModel? _bankData;
  ViewBankModel? get bankData => _bankData;

  setBankData(ViewBankModel value) {
    _bankData = value;
    notifyListeners();
  }

  Future<void> bankViewApi(context) async {
    UserViewModel userViewModal = UserViewModel();
    String? userId = await userViewModal.getUser();
    _viewBankRepo.viewBankApi(userId).then((value) {
      if (value.status == 200) {
        setBankData(value);
      } else {
        if (kDebugMode) {
        }
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print('UserProfileViewModel: $error');
      }
    });
  }
}

