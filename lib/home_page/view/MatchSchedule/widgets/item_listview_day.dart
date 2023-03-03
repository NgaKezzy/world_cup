import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_size.dart';

// ignore: must_be_immutable
class ItemListviewDay extends StatelessWidget {
  ItemListviewDay({super.key, required this.day, required this.dayMonth});

  String day;
  String dayMonth;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      width: AppSize.size100,
      height: 45,
      decoration: BoxDecoration(
          color: AppColors.orange, borderRadius: BorderRadius.circular(25)),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        TextCustom(text: day),
        TextCustom(text: dayMonth),
      ]),
    );
  }
}
