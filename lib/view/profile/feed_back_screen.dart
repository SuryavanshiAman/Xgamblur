import 'package:flutter/material.dart';
import 'package:xgamblur/generated/assets.dart';
import 'package:xgamblur/main.dart';
import 'package:xgamblur/res/circular_button.dart';
import 'package:xgamblur/res/color-const.dart';
import 'package:xgamblur/res/constantButton.dart';
import 'package:xgamblur/res/custom_text_field.dart';
import 'package:xgamblur/res/text_widget.dart';
import 'package:xgamblur/utils/utils.dart';
import 'package:xgamblur/view/game/Aviator/res/app_button.dart';
import 'package:xgamblur/view/game/wingo/res/gradient_app_bar.dart';
import 'package:xgamblur/view_model/feed_back_view_model.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class FeedBackScreen extends StatefulWidget {
  const FeedBackScreen({super.key});

  @override
  State<FeedBackScreen> createState() => _FeedBackScreenState();
}

class _FeedBackScreenState extends State<FeedBackScreen> {
  final TextEditingController _feedBackController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final feedBack = Provider.of<FeedBackViewModel>(context);
    return Scaffold(
      backgroundColor: AppColor.black,
      appBar: GradientAppBar(
        leading: AppBackBtn(),
        centerTitle: true,
        title: textWidget(
          text: 'Feedback'.tr,
          fontFamily: "SitkaSmall",
          fontWeight: FontWeight.w900,
          fontSize: 20,
          color: AppColor.white,
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          CustomTextField(
            controller: _feedBackController,
            label:
                'Welcome to feedback, please give feedback-please describe the problem in detail when providing feedback, preferably attach a screenshot of the problem you encountered, we will immediately process your feedback!',
            hintColor: AppColor.lightGray,
            hintSize: 16,
            height: 280,
            borderSide: BorderSide(color: Colors.white),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
            width: width * 0.65,
            maxLines: 10,
            filled: true,
            fillColor: AppColor.gray.withOpacity(0.5),
            border: Border.all(color: AppColor.gray.withOpacity(0.3)),
            borderRadius: BorderRadius.circular(15),
            fieldRadius: BorderRadius.circular(15),
          ),
          SizedBox(
            height: height * 0.03,
          ),
          Text(
              textAlign: TextAlign.center,
              "Send helpful feedback\n Chance to win Mystery Rewards".tr,
              style: TextStyle(
                  fontFamily: "SitkaSmall",
                  color: AppColor.white,
                  fontSize: 16)),
          Lottie.asset(Assets.lottieFeedBack, height: height * 0.25),
          feedBack.loading==false?  constantbutton(
            onTap: () {
              if (_feedBackController.text.isEmpty) {
                Utils.setSnackBar(
                    "Please enter the feedback".tr, AppColor.red, context);
              } else {
                feedBack.feedBackApi(_feedBackController.text, context);
              }
            },
            text: 'Submit'.tr,
          ):CircularButton()
        ],
      ),
    );
  }
}
