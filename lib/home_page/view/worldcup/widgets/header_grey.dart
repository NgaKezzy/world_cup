import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_font.dart';
import 'package:worldcup_app/config_app/app_size.dart';

class HeaderGrey extends StatelessWidget {
  HeaderGrey({super.key, required this.txtHeader});
  String txtHeader;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.size50,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: AppSize.size10),
            width: AppSize.sizeWidthApp,
            height: AppSize.size50 - 2,
            child: Row(children: [
              TextCustom(
                  text: txtHeader,
                  color: AppColors.black,
                  fontSize: AppSize.size16,
                  weight: FontFamily.medium),
            ]),
          ),
          Container(
            height: AppSize.size2,
            width: AppSize.sizeWidthApp,
            color: AppColors.grey_f2f,
          ),
        ],
      ),
    );
  }
}
