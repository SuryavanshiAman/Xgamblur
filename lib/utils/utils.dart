
import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:xgamblur/main.dart';
import 'package:xgamblur/res/app_colors.dart';
import 'package:xgamblur/res/color-const.dart';
import '../generated/assets.dart';
import '../res/constantButton.dart';
import '../view_model/user_view_model.dart';
import 'routes/routes_name.dart';

class Utils {
  static copyToClipboard(String code, BuildContext context) {
    Clipboard.setData(
      ClipboardData(
        text: code,

      ),
    ).then(
          (value) => ScaffoldMessenger.of(context).showSnackBar(
         SnackBar(
          backgroundColor: Colors.green,
          content: Text('Copied to clipboard'.tr),
        ),
      ),
    );
  }

  static void flushBarSuccessMessage(
      String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        message: message,
        forwardAnimationCurve: Curves.decelerate,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        duration: const Duration(seconds: 3),
        flushbarPosition: FlushbarPosition.TOP,
        backgroundColor: Colors.green,
        borderRadius: BorderRadius.circular(30),
        positionOffset: 20,
        icon: const Icon(
          Icons.error_outline,
          size: 20,
          color: Colors.white,
        ),
      )..show(context),
    );
  }

  static void flushBarErrorMessage(
      String message, BuildContext context) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        message: message,
        forwardAnimationCurve: Curves.decelerate,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
        duration: const Duration(seconds: 3),
        flushbarPosition: FlushbarPosition.TOP,
        borderRadius: BorderRadius.circular(30),
        backgroundColor: Colors.red,
        positionOffset: 20,
        icon: const Icon(
          Icons.error_outline,
          size: 20,
          color: AppColors.whiteColor,
        ),
      )..show(context),
    );
  }

  static setSnackBar(String msg,Color color, BuildContext context) {
    showToastWidget(
      Container(
        margin: EdgeInsets.only(top: 30),
        width: width*0.8,
        padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 4.0),
        decoration: BoxDecoration(
          color: color.withOpacity(0.7),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child:   Text(
          msg,
          style:  TextStyle(
            color:AppColor.white,
            fontSize: 16.0,
            fontWeight: FontWeight.w600
          ),
        ),
      ),
      context: context,
      animation: StyledToastAnimation.scale,
      reverseAnimation: StyledToastAnimation.slideToTop,
      position: StyledToastPosition.top,
      animDuration: const Duration(milliseconds: 300),
      duration: const Duration(seconds: 3),
      curve: Curves.elasticOut,
      reverseCurve: Curves.linear,
    );
  }

  static showExitConfirmation(BuildContext context) async {
    return await showModalBottomSheet(
      elevation: 5,
      backgroundColor: AppColor.darkGray,
      shape: const RoundedRectangleBorder(
          // side: BorderSide(width: 2, color: Colors.white),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35), topRight: Radius.circular(35))),
      context: context,
      builder: (context) {
        return Container(
          height: height * 0.4,
          padding: EdgeInsets.all(10),
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(35),
                  topRight: Radius.circular(35))),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 28.0, top: 28),
                child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.close,
                      color: AppColor.white,
                    )),
              ),
              SizedBox(height: height / 30),
               Center(
                child: Text("Exit App".tr,
                    style: TextStyle(
                        color: AppColor.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
              ),
              SizedBox(height: height * 0.02),
               Center(
                child: Text("Are you sure want to exit app?".tr,
                    style: TextStyle(
                        color: AppColor.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600)),
              ),
              SizedBox(height: height * 0.04),
              Center(
                child: SizedBox(
                  width: width * 4,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Center(child: constantbutton(
                          // width: width*0.8,
                          onTap: (){  SystemNavigator.pop();}, text: "Yes".tr)),
                      SizedBox(height: height * 0.03),
                      Center(child: constantbutton(
                          // width: width*0.8,
                          onTap: (){Navigator.pop(context);}, text: "No".tr)),

                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    ) ??
        false;
  }
  static Future<bool?> showLogOutConfirmation(BuildContext context) async {
    return await showModalBottomSheet(
      elevation: 5,
      backgroundColor: AppColor.darkGray,
      shape: const RoundedRectangleBorder(
        // side: BorderSide(width: 2, color: Colors.white),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(35),
          topRight: Radius.circular(35),
        ),
      ),
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(10),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(35),
              topRight: Radius.circular(35),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Adjust height dynamically
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 28.0, top: 28),
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.close,
                    color: AppColor.white,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: AppColor.gray,
                  child: Image.asset("assets/images/log_out.png",
                    color: AppColor.white,
                    scale: 2,
                  ),
                ),
              ),
              const SizedBox(height: 16),
               Center(
                child: Text(
                  "Logging out?".tr,
                  style: TextStyle(
                    color: AppColor.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 8),
               Center(
                child: Text(
                  "Are you sure you want to log out of this\naccount?".tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColor.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Center(
                child: constantbutton(
                    // width: width*0.8,
                    onTap:( ){
                      UserViewModel userViewModel = UserViewModel();
                      userViewModel.remove();
                      Navigator.of(context, rootNavigator: true).pop();
                      Navigator.pushReplacementNamed(
                          context, RoutesName.loginScreen);
                    }, text: "Yes, Logout".tr),
              ),
              const SizedBox(height: 16),
              Center(
                child: constantbutton(
                    // width: width*0.8,
                    onTap:( ){
                      Navigator.pop(context, false);
                    }, text: "Cancel".tr),
              ),
              const SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }
  static Future<void> launchURL(String url) async {
    try {
      Uri uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        debugPrint("Could not launch: $uri");
      }
    } catch (e) {
      debugPrint("Error launching URL: $e");
    }
  }
}
