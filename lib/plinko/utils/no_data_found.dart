import 'package:flutter/material.dart';
import 'package:xgamblur/main.dart';

import '../../generated/assets.dart';
import '../../res/app_colors.dart';
import '../../res/plinko_text_widget.dart';

class NoDataFoundPage extends StatelessWidget {
  const NoDataFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20,bottom: 20),
          height: height * 0.1,
          width: width * 0.2,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(Assets.imagesNoDataAvailable),
                  fit: BoxFit.fill)),
        ),
        const TextWidget(
          title: 'No Record',
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.whiteColor,
          fontFamily: "open_sans_reg",
        ),
        SizedBox(
          height: height * 0.01,
        ),
        const TextWidget(
            title: 'Haven’t found any record',
            fontSize: 13,
            fontFamily: "open_sans_reg",
            color: Colors.grey),
      ],
    );
  }
}
