import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_font.dart';
import 'package:worldcup_app/config_app/app_size.dart';

class PersonalDetail extends StatelessWidget {
  const PersonalDetail(
      {super.key, required this.title, required this.description});
  final String title;
  final String description;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.size45,
      width: AppSize.sizeWidthApp,
      child: Column(
        children: [
          Container(
            height: AppSize.size1,
            width: AppSize.sizeWidthApp,
            color: AppColors.grey.withOpacity(0.4),
          ),
          SizedBox(
            height: AppSize.size45 - 1,
            width: AppSize.sizeWidthApp,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextCustom(text: title, color: AppColors.black),
                TextCustom(
                  text: description,
                  color: AppColors.black,
                  weight: FontFamily.semiBold,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
