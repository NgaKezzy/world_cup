import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_size.dart';
import 'package:worldcup_app/config_app/config_app.dart';
import 'package:worldcup_app/models/flag.dart';

class ItemYellowCard extends StatelessWidget {
  final String time;
  final String infomation;
  final String type;
  final String teamName;
  const ItemYellowCard(
      {super.key,
      required this.time,
      required this.infomation,
      required this.type,
      required this.teamName});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.grey_f2f,
      width: AppSize.sizeWidthApp,
      height: AppSize.size80,
      // padding: const EdgeInsets.symmetric(horizontal: AppSize.size20),
      child: Row(
        children: [
          Container(
            width: AppSize.sizeWidthApp * 0.23,
            height: AppSize.size80,
            // color: AppColors.grey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  alignment: Alignment.center,
                  height: AppSize.size35,
                  width: AppSize.size35,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: AppColors.blue_2D1),
                  child: type == 'Goal'
                      ? SvgPicture.asset(
                          'assets/svg/soccer.svg',
                          color: AppColors.white,
                          height: AppSize.size20,
                        )
                      : Container(
                          height: AppSize.size30 * 0.9,
                          width: AppSize.size20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(AppSize.size5),
                            color: type != 'yellow card'
                                ? AppColors.red
                                : AppColors.yellow,
                          ),
                        ),
                ),
                const SizedBox(height: AppSize.size5),
                TextCustom(
                  text: time,
                  color: AppColors.black,
                )
              ],
            ),
          ),
          Container(
            height: AppSize.size80,
            color: AppColors.grey_f2f,
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: AppSize.size80 - 1,
                      padding: const EdgeInsets.symmetric(
                          horizontal: AppSize.size10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextCustom(
                            text: type,
                            color: AppColors.black,
                            weight: FontFamily.semiBold,
                          ),
                          TextCustom(
                            text: infomation,
                            color: AppColors.black,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: AppSize.size10),
                SvgPicture.asset(
                  Flag.allFlags[teamName] ?? 'assets/svg/flag/vn.svg',
                  height: AppSize.size18,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
