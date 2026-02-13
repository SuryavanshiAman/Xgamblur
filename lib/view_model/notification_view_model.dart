import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:bettsix/generated/assets.dart';
import 'package:bettsix/model/notification_model.dart';
import 'package:bettsix/model/profile_model.dart';
import 'package:bettsix/repo/notification_repo.dart';
import 'package:bettsix/repo/profile_repo.dart';
import 'package:bettsix/utils/routes/routes_name.dart';
import 'package:bettsix/view_model/user_view_model.dart';
import 'package:iconly/iconly.dart';

class NotificationViewModel with ChangeNotifier {

  final _notificationRepo = NotificationRepo();

  NotificationModel? _notificationData;
  NotificationModel? get notificationData => _notificationData;

  setNotification(NotificationModel value) {
    _notificationData = value;
    notifyListeners();
  }

  Future<void> notificationApi(context) async {
    _notificationRepo.notificationApi().then((value) {
      if (value.status == 200) {
        setNotification(value);
      } else {
        if (kDebugMode) {
        }
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print('notificationApi: $error');
      }
    });
  }
}

