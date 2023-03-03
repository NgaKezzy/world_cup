import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_font.dart';
import 'package:worldcup_app/config_app/app_size.dart';

class ItemStatsStatistics extends StatelessWidget {
  const ItemStatsStatistics(
      {super.key,
      required this.title,
      required this.result1,
      required this.result2});

  final String title;
  final String result1;
  final String result2;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.size40,
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
                  text: result1,
                  color: AppColors.black,
                  weight: FontFamily.semiBold,
                ),
                TextCustom(
                  text: title,
                  color: AppColors.black,
                ),
                TextCustom(
                  text: result2,
                  color: AppColors.black,
                  weight: FontFamily.semiBold,
                ),
              ],
            ),
          ),
          Container(
            height: AppSize.size1,
            width: AppSize.sizeWidthApp,
            color: AppColors.grey_f2f,
          )
        ],
      ),
    );
  }
}
