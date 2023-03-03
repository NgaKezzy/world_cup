import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_font.dart';
import 'package:worldcup_app/config_app/app_size.dart';

class ItemRecordPlayer extends StatelessWidget {
  ItemRecordPlayer({super.key, required this.title});
  String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: AppSize.sizeWidthApp * 0.45,
      color: AppColors.purple,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextCustom(
            text: title,
          ),
          const TextCustom(
              text: '6',
              weight: FontFamily.bold,
              color: AppColors.pink,
              fontSize: AppSize.size30),
        ],
      ),
    );
  }
}
