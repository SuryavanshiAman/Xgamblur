import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:bettsix/generated/assets.dart';
import 'package:bettsix/model/choose_model.dart';
import 'package:bettsix/model/profile_model.dart';
import 'package:bettsix/repo/choose_bank_repo.dart';
import 'package:bettsix/repo/profile_repo.dart';
import 'package:bettsix/utils/routes/routes_name.dart';
import 'package:bettsix/view_model/user_view_model.dart';
import 'package:iconly/iconly.dart';

class ChooseBankViewModel with ChangeNotifier {
  final _bankNameRepository = ChooseBankRepo();

  ChooseBankModel? _bankNameData;
  ChooseBankModel? get bankNameData => _bankNameData;

  setBankName(ChooseBankModel value) {
    _bankNameData = value;
    notifyListeners();
  }
String _bankName="";

  String get bankName => _bankName;

  setBank(String value) {
    _bankName = value;
     notifyListeners();
  }
  Future<void> chooseBankApi(context) async {
    UserViewModel userViewModal = UserViewModel();
    String? userId = await userViewModal.getUser();
    _bankNameRepository.chooseBankApi().then((value) {
      if (value.status == 200) {
        setBankName(value);
      } else {
        if (kDebugMode) {
        }
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print('chooseBankApi: $error');
      }
    });
  }
}
