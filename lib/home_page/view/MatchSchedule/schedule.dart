import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_size.dart';
import 'package:worldcup_app/home_page/view/MatchSchedule/widgets/item_schdule.dart';

class Schedule extends StatelessWidget {
  const Schedule({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.sizeHeightApp,
      width: AppSize.sizeWidthApp,
      color: AppColors.red_631,
      child: Column(
        children: [
          const SizedBox(
            height: AppSize.size20,
          ),
          SizedBox(height: AppSize.size15, width: AppSize.sizeWidthApp),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              ItemSchdule(),
            ],
          )
        ],
      ),
    );
  }
}
