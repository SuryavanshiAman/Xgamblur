import 'package:flutter/foundation.dart';
import 'package:bettsix/model/all_game_list_model.dart';
import 'package:bettsix/repo/all_game_list_repo.dart';

class AllGameListViewModel with ChangeNotifier {
  final _allGameList = AllGameListRepo();

  AllGameListModel? _allGameData;
  AllGameListModel? get allGameData => _allGameData;

  setAllGame(AllGameListModel value) {
    _allGameData = value;
    notifyListeners();
  }
  List getGamesChunk(int start, int limit) {
    final list = _allGameData?.data ?? [];

    if (start >= list.length) return [];

    int end = start + limit;
    if (end > list.length) end = list.length;

    return list.sublist(start, end);
  }

  Future<void> allGameListApi(context) async {
    _allGameList.allGameListApi().then((value) {
      if (value.status == true) {
        setAllGame(value);
      } else {
        if (kDebugMode) {
          print('value: ${value.message}');
        }
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print('allGameListApi: $error');
      }
    });
  }
}

