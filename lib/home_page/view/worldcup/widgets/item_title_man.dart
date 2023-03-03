import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_font.dart';
import 'package:worldcup_app/config_app/app_size.dart';
import 'package:worldcup_app/home_page/view/worldcup/widgets/item_man_of_match.dart';

class ItemTitleMan extends StatelessWidget {
  ItemTitleMan({super.key, required this.title});
  String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppSize.sizeWidthApp,
      color: AppColors.white,
      padding: const EdgeInsets.symmetric(
          horizontal: AppSize.size10, vertical: AppSize.size20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextCustom(
              text: title,
              color: AppColors.black,
              weight: FontFamily.semiBold,
              fontSize: AppSize.size16),
          const SizedBox(
            height: AppSize.size20,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                height: AppSize.size30,
                width: AppSize.sizeWidthApp * 0.4 - 10,
                color: AppColors.grey.withOpacity(0.2),
                padding: const EdgeInsets.only(left: AppSize.size10),
                child:
                    const TextCustom(text: 'Fixture', color: AppColors.black),
              ),
              Container(
                alignment: Alignment.centerLeft,
                height: AppSize.size30,
                width: AppSize.sizeWidthApp * 0.6 - 10,
                color: AppColors.grey.withOpacity(0.2),
                padding: const EdgeInsets.only(left: AppSize.size10),
                child: const TextCustom(
                    text: 'Man of the Match', color: AppColors.black),
              ),
            ],
          ),
          ItemManOfMatch(),
          ItemManOfMatch(),
          ItemManOfMatch(),
          ItemManOfMatch(),
          ItemManOfMatch(),
          // SizedBox(height: AppSize.size30),

          /*------------------------------ */
        ],
      ),
    );
  }
}
