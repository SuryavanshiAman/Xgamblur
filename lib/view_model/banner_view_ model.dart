import 'package:flutter/foundation.dart';
import 'package:xgamblur/model/banner_model.dart';
import 'package:xgamblur/repo/banner_repo.dart';

class BannerViewModel with ChangeNotifier {
  final _bannerRepo = BannerRepository();

  BannerModel? _bannerResponse;
  BannerModel? get bannerResponse => _bannerResponse;

  setBannerModel(BannerModel banner) {
    _bannerResponse = banner;
    notifyListeners();
  }

  Future<void> bannerApi(context) async {
    _bannerRepo.bannerApi().then((value) {
      if (value.status == 200) {
        setBannerModel(value);
      } else {
        if (kDebugMode) {
          print('No Data');
        }
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print('error: $error');
      }
    });
  }
}