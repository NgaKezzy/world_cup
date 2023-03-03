import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_font.dart';
import 'package:worldcup_app/config_app/app_size.dart';

class ItemPlayerStart extends StatelessWidget {
  ItemPlayerStart({super.key, required this.txt});
  String txt;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.size10),
      height: AppSize.size45,
      width: AppSize.sizeWidthApp,
      child: Column(
        children: [
          Container(
            height: AppSize.size1,
            width: AppSize.sizeWidthApp,
            color: AppColors.grey.withOpacity(0.4),
          ),
          Container(
            height: AppSize.size45 - 1,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextCustom(
                      text: txt,
                      color: AppColors.black,
                      fontSize: AppSize.size16),
                  const TextCustom(
                      text: '1',
                      color: AppColors.black,
                      fontSize: AppSize.size16,
                      weight: FontFamily.semiBold)
                ]),
          ),
        ],
      ),
    );
  }
}
