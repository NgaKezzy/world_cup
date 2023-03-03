import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_font.dart';
import 'package:worldcup_app/config_app/app_size.dart';
import 'package:worldcup_app/home_page/view/worldcup/widgets/header_squad.dart';
import 'package:worldcup_app/home_page/view/worldcup/widgets/iteam_player_start.dart';

class TabPlayer extends StatelessWidget {
  const TabPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
          horizontal: AppSize.size10, vertical: AppSize.size10),
      color: AppColors.grey.withOpacity(0.3),
      height: AppSize.sizeHeightApp,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: AppSize.sizeWidthApp,
              color: AppColors.white,
              child: Column(children: [
                HeaaderSquad(txtHeader: 'Wins'),
                ItemPlayerStart(txt: 'Losses'),
                ItemPlayerStart(txt: 'Goals'),
                ItemPlayerStart(txt: 'Goals Conceded'),
              ]),
            ),
            SizedBox(height: AppSize.size20),
            Container(
              width: AppSize.sizeWidthApp,
              color: AppColors.white,
              child: Column(children: [
                HeaaderSquad(txtHeader: 'Shots'),
                ItemPlayerStart(txt: 'Shots on target'),
                ItemPlayerStart(txt: 'Hit woodword'),
                ItemPlayerStart(txt: 'Shots with right foot'),
                ItemPlayerStart(txt: 'Goals with right foot'),
                ItemPlayerStart(txt: 'Shots with left foot'),
                ItemPlayerStart(txt: 'Goals with left foot'),
                ItemPlayerStart(txt: 'Shots with header'),
                ItemPlayerStart(txt: 'Goals with header'),
              ]),
            ),
            SizedBox(height: AppSize.size20),
            Container(
              width: AppSize.sizeWidthApp,
              color: AppColors.white,
              child: Column(children: [
                HeaaderSquad(txtHeader: 'Passes Complete'),
                ItemPlayerStart(txt: 'Offsides'),
              ]),
            ),
            SizedBox(height: AppSize.size20),
            Container(
              width: AppSize.sizeWidthApp,
              color: AppColors.white,
              child: Column(children: [
                HeaaderSquad(txtHeader: 'Tackled'),
                ItemPlayerStart(txt: 'Bad touches'),
                ItemPlayerStart(txt: 'Errors leading to goal'),
                ItemPlayerStart(txt: 'Big chance missed'),
                ItemPlayerStart(txt: 'Own goals'),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
