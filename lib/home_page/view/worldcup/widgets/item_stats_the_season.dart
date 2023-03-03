import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_font.dart';
import 'package:worldcup_app/config_app/app_size.dart';

class ItemStatsTheSeason extends StatelessWidget {
  ItemStatsTheSeason({super.key, required this.title});
  String intLeft = '10';
  String intRight = '10';
  String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.size60,
      // color: AppColors.green,
      width: AppSize.sizeWidthApp,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: AppSize.size20),
            height: AppSize.size40 - 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextCustom(
                  text: intLeft,
                  color: AppColors.black,
                  weight: FontFamily.medium,
                ),
                TextCustom(
                  text: title,
                  color: AppColors.black,
                ),
                TextCustom(
                  text: intRight,
                  color: AppColors.black,
                  weight: FontFamily.medium,
                ),
              ],
            ),
          ),
          Container(
              height: AppSize.size1,
              width: AppSize.sizeWidthApp,
              color: AppColors.grey)
        ],
      ),
    );
  }
}
