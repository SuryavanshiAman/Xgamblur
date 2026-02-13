import 'package:flutter/foundation.dart';
import 'package:bettsix/model/avtar_model.dart';
import 'package:bettsix/repo/avtar_image_repo.dart';

class AvtarViewModel with ChangeNotifier {
  final _avtarRepository = AvtarImageRepository();

  AvtarModel? _setAvtarData;
  AvtarModel? get avtarData => _setAvtarData;

  setAvtar(AvtarModel value) {
    _setAvtarData = value;
    notifyListeners();
  }

  Future<void> avtarApi(context) async {
    _avtarRepository.avtarImageApi().then((value) {
      if (value.status == 200) {
        setAvtar(value);
      } else {
        if (kDebugMode) {
          print('value: ${value.message}');
        }
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print('avtarApi: $error');
      }
    });
  }
}
