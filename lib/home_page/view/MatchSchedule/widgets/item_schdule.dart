import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_size.dart';
import 'package:worldcup_app/home_page/view/MatchSchedule/widgets/day_schdule.dart';
import 'package:worldcup_app/home_page/view/MatchSchedule/widgets/item_match_schdule.dart';
import 'package:worldcup_app/home_page/view/MatchSchedule/widgets/item_schdule_play.dart';

class ItemSchdule extends StatelessWidget {
  const ItemSchdule({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: AppSize.size45,
              width: AppSize.sizeWidthApp * 0.7,
              padding: const EdgeInsets.symmetric(horizontal: AppSize.size10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(AppSize.size5),
                  color: AppColors.white),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    TextCustom(
                      text: 'Vòng Bảng - lượt 6 (hiện tại)',
                    ),
                    Icon(Icons.expand_more, color: AppColors.black),
                  ]),
            ),
          ],
        ),
        Container(
          height: AppSize.sizeHeightApp - 216,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              margin: const EdgeInsets.only(top: AppSize.size20),
              width: AppSize.sizeWidthApp,
              padding: const EdgeInsets.symmetric(horizontal: AppSize.size10),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    DaySchdule(),
                    DaySchdule(),
                    DaySchdule(),
                    SizedBox(
                      height: 50,
                    ),
                  ]),
            ),
          ),
        ),
      ],
    );
  }
}
