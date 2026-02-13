
import 'package:flutter/foundation.dart';
import 'package:bettsix/res/color-const.dart';
import 'package:bettsix/utils/utils.dart';
import 'package:bettsix/view/game/wingo/repo/win_go_my_his_repo.dart';
import 'package:bettsix/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

import '../controller/win_go_controller.dart';
import '../model/win_go_my_his_model.dart';

class WinGoMyHisViewModel with ChangeNotifier {
  final _winGoMyHisRepo=WinGoMyHisRepository();

  bool _loading = false;
  bool get loading => _loading;
  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  WinGoMyHisModel? _winGoMyHisModelData;
  WinGoMyHisModel? get winGoMyHisModelData => _winGoMyHisModelData;
  setBetHistoryData(WinGoMyHisModel value) {
    _winGoMyHisModelData = value;
    notifyListeners();
  }



  Future<void> myBetHisApi(context,int offset) async {
    setLoading(true);
    final wgc = Provider.of<WinGoController>(context, listen: false);
    UserViewModel userViewModal = UserViewModel();
    String? userId = await userViewModal.getUser();
    Map data={
      "game_id":(wgc.gameIndex + 1).toString(),
      "userid":userId,
      "limit":"10",
      "offset":offset
    };
    _winGoMyHisRepo.myBetHisApi(data).then((value) {
      if (value.status == 200) {
        setLoading(false);
        setBetHistoryData(value);
      } else {
        setLoading(false);
        Utils.setSnackBar(
            value.message.toString(),AppColor.red, context, );
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        print('error: $error');
      }
    });
  }
}