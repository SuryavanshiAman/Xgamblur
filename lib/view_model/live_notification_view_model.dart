import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:bettsix/generated/assets.dart';
import 'package:bettsix/model/live_notification_model.dart';
import 'package:bettsix/model/profile_model.dart';
import 'package:bettsix/repo/live_nootification_repo.dart';
import 'package:bettsix/repo/profile_repo.dart';
import 'package:bettsix/utils/routes/routes_name.dart';
import 'package:bettsix/view_model/user_view_model.dart';
import 'package:iconly/iconly.dart';

class LiveNotificationViewModel with ChangeNotifier {
  final _live = LiveNotificationRepo();


  LiveNotificationModel? _setProfileData;
  LiveNotificationModel? get profileData => _setProfileData;

  setProfile(LiveNotificationModel value) {
    _setProfileData = value;
    notifyListeners();
  }

  Future<void> liveNotificationApi(context) async {
    _live.liveNotificationApi().then((value) {
      if (value.status == 200) {
        setProfile(value);
      } else {
        if (kDebugMode) {
        }
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print('liveNotificationApi: $error');
      }
    });
  }
}

