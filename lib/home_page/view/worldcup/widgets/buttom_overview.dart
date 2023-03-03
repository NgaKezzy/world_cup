import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_size.dart';

class ButtomOverview extends StatelessWidget {
  ButtomOverview({super.key, required this.txt});
  String txt;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.size50,
      width: AppSize.sizeWidthApp,
      color: AppColors.black.withOpacity(0.7),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        TextCustom(text: txt, fontSize: AppSize.size16),
        const SizedBox(width: AppSize.size10),
        const Icon(Icons.login, size: 20, color: AppColors.white),
      ]),
    );
  }
}
