import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:bettsix/generated/assets.dart';
import 'package:bettsix/model/customer_service_model.dart';
import 'package:bettsix/model/profile_model.dart';
import 'package:bettsix/repo/customer_service_repo.dart';
import 'package:bettsix/repo/profile_repo.dart';
import 'package:bettsix/utils/routes/routes_name.dart';
import 'package:bettsix/view_model/user_view_model.dart';
import 'package:iconly/iconly.dart';

class CustomerServiceViewModel with ChangeNotifier {

  final _customerServiceRepository = CustomerServiceRepo();


  CustomerServiceModel? _setCustomerData;
  CustomerServiceModel? get setCustomerData => _setCustomerData;

  setCustomer(CustomerServiceModel value) {
    _setCustomerData = value;
    notifyListeners();
  }

  Future<void> customerServiceApi(context) async {
    _customerServiceRepository.customerServiceApi().then((value) {
      if (value.status == 200) {
        setCustomer(value);
      } else {
        setCustomer(value);
        if (kDebugMode) {
          print('value: ${value.message}');
        }
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print('customerServiceApi: $error');
      }
    });
  }
}

