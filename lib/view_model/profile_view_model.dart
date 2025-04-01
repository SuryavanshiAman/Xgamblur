import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:xgamblur/generated/assets.dart';
import 'package:xgamblur/model/profile_model.dart';
import 'package:xgamblur/repo/profile_repo.dart';
import 'package:xgamblur/utils/routes/routes_name.dart';
import 'package:xgamblur/view_model/user_view_model.dart';
import 'package:iconly/iconly.dart';

class ProfileViewModel with ChangeNotifier {
  List<ElementModel> elementList = [
    ElementModel(
        image:"assets/images/game_history.png",
        name: 'Game History',
        subTitle: "My game history",
        onTap: (context){
          Navigator.pushNamed(context, RoutesName.gameHistoryScreen);
        }),
    ElementModel(
        image: "assets/images/trans_history.png",
        name: 'Transaction',
        subTitle: "My transaction history",
        onTap: (context){
          Navigator.pushNamed(context, RoutesName.transactionHistoryScreen);
        }),
    ElementModel(
        image: "assets/images/deposit_history.png",
        name: 'Deposit',
        subTitle: "My deposit history",
        onTap: (context){
          Navigator.pushNamed(context, RoutesName.depositHistoryScreen);
        }),
    ElementModel(
        image:"assets/images/withdrawHistory.png",
        name: 'Withdraw',
        subTitle: "My withdraw history",
        onTap: (context){
          Navigator.pushNamed(context, RoutesName.withdrawHistoryScreen);
        }),
  ];
  List<Map<String, String>>elementListTwo=[
    {
      "images":"assets/images/notification.png",
      "title":"Notification",
    },
    {
      "images":"assets/images/gifts.png",
      "title":"Gift",
    },
    {
      "images":"assets/images/language.png",
      "title":"Language",
    },
  ];
  List<Map<String, String>>elementListThree=[
    {
      "images":Assets.svgReffer,
      "title":"Refer",
    },
    {
      "images":Assets.svgSetting,
      "title":"Settings",
    },
    {
      "images":Assets.svgFeedback,
      "title":"Feedback",
    },
    {
      "images":Assets.svgNotification,
      "title":"Notification",
    },
    {
      "images":Assets.svgCustomer,
      "title":"Customer Service",
    },
    // {
    //   "images":Assets.svgBigGuide,
    //   "title":"Beginner's Guide",
    // },
    {
      "images":"assets/svg/aboutus.svg",
      "title":"About us",
    },
  ];
  final _userProfileRepository = UserProfileRepository();

  dynamic _balance = 0.0;

  dynamic get balance => _balance;

  void addBalance(dynamic amount) {
    _balance += amount;
    notifyListeners();
  }

  void deductBalance(dynamic amount) {
    _balance -= amount;
    notifyListeners();
  }

  void setBalance(dynamic amount) {
    _balance = amount;
    notifyListeners();
  }

  ProfileModel? _setProfileData;
  ProfileModel? get profileData => _setProfileData;

  setProfile(ProfileModel value) {
    _setProfileData = value;
    notifyListeners();
  }

  Future<void> userProfileApi(context) async {
    UserViewModel userViewModal = UserViewModel();
    String? userId = await userViewModal.getUser();
    _userProfileRepository.userProfileApi(userId).then((value) {
      if (value.status == 200) {
        setProfile(value);
        print("aman");
        print(value.data?.name);
      } else {
        if (kDebugMode) {
          print('value: ${value.message}');
        }
      }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print('UserProfileViewModel: $error');
      }
    });
  }
}

class ElementModel{
  final String image;
  final String name;
  final String subTitle;
  final Function(BuildContext)? onTap;
  ElementModel({required this.image,required this.name,required this.subTitle,required this.onTap,});

}