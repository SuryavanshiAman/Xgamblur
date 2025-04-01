import 'package:flutter/foundation.dart';
import 'package:xgamblur/view_model/user_view_model.dart';

import '../model/aviator_history_model.dart';
import '../repo/aviator_history_repo.dart';


class AviatorHistoryViewModel with ChangeNotifier {
  final _aviatorHistoryRepo = AviatorHistoryRepository();

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  AviatorHistoryModel? _aviatorHistoryModel;
  AviatorHistoryModel? get aviatorHistoryModel => _aviatorHistoryModel;

  setAviatorHistory(AviatorHistoryModel aviatorHistory) {
    _aviatorHistoryModel = aviatorHistory;
    notifyListeners();
  }

  Future<void> aviatorHistoryApi(context) async {
    setLoading(true);
    UserViewModel userViewModel = UserViewModel();
    String? userId = await userViewModel.getUser();
    Map data={"uid":userId, "game_id":"5"};
    _aviatorHistoryRepo.aviatorHistoryApi(data).then((value) {
      if (value.status == 200) {
        setLoading(false);
        setAviatorHistory(value);
      } else {
        setLoading(false);
        if (kDebugMode) {
          print('Aviator history api error!');
        }
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        print('error: $error');
      }
    });
  }
}