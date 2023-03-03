import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_font.dart';
import 'package:worldcup_app/config_app/app_size.dart';

class ItemPlaying extends StatelessWidget {
  ItemPlaying(
      {super.key,
      required this.txtSeasons,
      required this.txtClub,
      required this.txtApp,
      required this.txtGoal});
  String txtSeasons;
  String txtClub;
  String txtApp;
  String txtGoal;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.size45,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
              width: AppSize.sizeWidthApp * 0.28,
              child: TextCustom(
                text: txtSeasons,
                color: AppColors.black,
              )),
          SizedBox(
              width: AppSize.sizeWidthApp * 0.28,
              child: TextCustom(
                text: txtClub,
                color: AppColors.black,
              )),
          Container(
              alignment: Alignment.center,
              width: AppSize.sizeWidthApp * 0.2,
              child: TextCustom(
                text: txtApp,
                color: AppColors.black,
              )),
          Container(
            alignment: Alignment.center,
            width: AppSize.sizeWidthApp * 0.13,
            child: TextCustom(
                text: txtGoal, color: AppColors.black, weight: FontFamily.semiBold),
          ),
        ],
      ),
    );
  }
}
