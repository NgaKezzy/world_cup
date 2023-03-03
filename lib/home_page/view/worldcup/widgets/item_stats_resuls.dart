import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_font.dart';
import 'package:worldcup_app/config_app/app_size.dart';
import 'package:worldcup_app/models/flag.dart';

class ItemStatsResuls extends StatelessWidget {
  final String nameTeam1;
  final String nameTeam2;
  final String result1;
  final String result2;
  const ItemStatsResuls(
      {super.key,
      required this.nameTeam1,
      required this.nameTeam2,
      required this.result1,
      required this.result2});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppSize.size70,
      width: AppSize.sizeWidthApp,
      // color: AppColors.green,
      child: Column(
        children: [
          Container(
            height: AppSize.size1,
            width: AppSize.sizeWidthApp,
            color: AppColors.grey_f2f,
          ),
          SizedBox(
            height: AppSize.size70 - 1,
            width: AppSize.sizeWidthApp,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(
                        child: TextCustom(
                          weight: FontFamily.medium,
                          text: nameTeam1,
                          color: AppColors.black,
                        ),
                      ),
                      const SizedBox(width: AppSize.size10),
                      SvgPicture.asset(
                        Flag.allFlags[nameTeam1]!,
                        height: AppSize.size16,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: AppSize.size30,
                        color: AppColors.purple,
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSize.size10,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextCustom(
                              text: result1.toString(),
                              fontSize: AppSize.size16,
                              weight: FontFamily.semiBold,
                            ),
                            const SizedBox(width: AppSize.size10),
                            Container(
                                color: AppColors.white,
                                width: AppSize.size1,
                                height: AppSize.size20),
                            const SizedBox(width: AppSize.size10),
                            TextCustom(
                              text: result2.toString(),
                              fontSize: AppSize.size16,
                              weight: FontFamily.semiBold,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SvgPicture.asset(
                        Flag.allFlags[nameTeam2]!,
                        height: AppSize.size16,
                      ),
                      const SizedBox(width: AppSize.size10),
                      SizedBox(
                        child: TextCustom(
                          text: nameTeam2,
                          weight: FontFamily.medium,
                          color: AppColors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
