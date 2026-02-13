import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:bettsix/repo/update_profile.dart';
import 'package:bettsix/res/color-const.dart';
import 'package:bettsix/utils/routes/routes_name.dart';
import 'package:bettsix/utils/utils.dart';
import 'package:bettsix/view_model/user_view_model.dart';

class UpdateViewModel with ChangeNotifier {
  final _updateRepo = UpdateProfileRepository();

  bool _loading = false;

  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> updateImageApi(dynamic imgId ,dynamic name, context) async {
    setLoading(true);
    UserViewModel userViewModel = UserViewModel();
    String? userId = await userViewModel.getUser();
    print("ggggg$name");
    Map data={
      "id":userId,
      "image_id": imgId ,
      "name":name
    };
    print(data);
    _updateRepo.updateApi(data).then((value) {
      if (value['status'] == 200) {
        setLoading(false);
        Navigator.pushReplacementNamed(context, RoutesName.bottomNavBar);
        Utils.setSnackBar(value['message'],AppColor.green, context);
      }
      else {
        setLoading(false);
        Utils.setSnackBar(value['message'],AppColor.red, context);
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        print('updateApi: $error');
      }
    });
  }
}