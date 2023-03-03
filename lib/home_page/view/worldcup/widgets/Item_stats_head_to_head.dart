import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_font.dart';
import 'package:worldcup_app/config_app/app_size.dart';

class ItemStatsHeadToHead extends StatelessWidget {
  final int resultIndex1;
  final int resultIndex2;
  ItemStatsHeadToHead(
      {super.key,
      required this.title,
      required this.resultIndex1,
      required this.resultIndex2});
  String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.size40,
      // color: AppColors.green,
      width: AppSize.sizeWidthApp,
      child: Column(
        children: [
          Container(
              height: AppSize.size1,
              width: AppSize.sizeWidthApp,
              color: AppColors.grey),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: AppSize.size10),
            height: AppSize.size40 - 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextCustom(
                  text: resultIndex1.toString(),
                  color: AppColors.black,
                  weight: FontFamily.semiBold,
                ),
                TextCustom(
                  text: title,
                  color: AppColors.black,
                ),
                TextCustom(
                  text: resultIndex2.toString(),
                  color: AppColors.black,
                  weight: FontFamily.semiBold,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
