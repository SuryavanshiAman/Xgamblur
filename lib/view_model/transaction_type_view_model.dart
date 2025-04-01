import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:xgamblur/generated/assets.dart';
import 'package:xgamblur/model/profile_model.dart';
import 'package:xgamblur/model/transaction_model.dart';
import 'package:xgamblur/repo/profile_repo.dart';
import 'package:xgamblur/repo/transaction_type_repo.dart';
import 'package:xgamblur/utils/routes/routes_name.dart';
import 'package:xgamblur/view_model/user_view_model.dart';
import 'package:iconly/iconly.dart';

class TransactionTypeViewModel with ChangeNotifier {
  final _transactionTypeRepo = TransactionTypeRepo();


  TransactionTypeModel? _transactionTypeData;
  TransactionTypeModel? get transactionTypeData => _transactionTypeData;

  setTransactionType(TransactionTypeModel value) {
    _transactionTypeData = value;
    notifyListeners();
  }

  Future<void> transactionTypeApi(context) async {
    _transactionTypeRepo.transactionTypeApi().then((value) {
      if (value.status == 200) {
        setTransactionType(value);
      } else {
        if (kDebugMode) {
        }
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print('transactionTypeApi: $error');
      }
    });
  }
}

