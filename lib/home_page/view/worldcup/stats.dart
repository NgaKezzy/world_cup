import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_font.dart';
import 'package:worldcup_app/config_app/app_routes.dart';
import 'package:worldcup_app/config_app/app_size.dart';
import 'package:worldcup_app/detail_match/controllers/details_match_controller.dart';
import 'package:worldcup_app/home_page/view/worldcup/widgets/Item_form_guide.dart';
import 'package:worldcup_app/home_page/view/worldcup/widgets/Item_stats_head_to_head.dart';
import 'package:worldcup_app/home_page/view/worldcup/widgets/Item_stats_statistics.dart';
import 'package:worldcup_app/home_page/view/worldcup/widgets/item_stats_resuls.dart';
import 'package:worldcup_app/home_page/view/worldcup/widgets/item_stats_the_season.dart';
import 'package:worldcup_app/models/headtohead/head_to_head.dart';
import 'package:worldcup_app/models/headtohead/head_to_head_item.dart';
import 'package:worldcup_app/models/statistic/item_statistic.dart';

class Stats extends GetView<DetailsMatchController> {
  const Stats({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: AppSize.size10,
            width: AppSize.sizeWidthApp,
            color: AppColors.grey.withOpacity(0.3),
          ),
          Container(
            color: AppColors.white,
            width: AppSize.sizeWidthApp,
            padding: const EdgeInsets.symmetric(
              vertical: AppSize.size20,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    TextCustom(
                      text: 'Statistics'.tr,
                      color: AppColors.black,
                      weight: FontFamily.semiBold,
                      fontSize: AppSize.size16,
                    ),
                  ],
                ),
                const SizedBox(height: AppSize.size15),
                if (controller
                    .dataStatisticMatch.dataResponse[0].statistics.isEmpty)
                  Center(
                    child: TextCustom(
                      text: 'Thematchhasntstartedyet'.tr,
                      color: AppColors.black,
                    ),
                  ),
                for (ItemStatistic statistic
                    in controller.dataStatisticMatch.dataResponse[0].statistics)
                  if (statistic.type == 'Ball Possession')
                    ItemStatsStatistics(
                      title: 'Possession %',
                      result1: statistic.home,
                      result2: statistic.away,
                    )
                  else
                    ItemStatsStatistics(
                      title: statistic.type,
                      result1: statistic.home,
                      result2: statistic.away,
                    ),
                const SizedBox(height: AppSize.size15),
              ],
            ),
          ),
          Container(
            height: AppSize.size10,
            width: AppSize.sizeWidthApp,
            color: AppColors.grey_f2f,
          ),
          Container(
            color: AppColors.white,
            width: AppSize.sizeWidthApp,
            padding: const EdgeInsets.symmetric(
                horizontal: AppSize.size20, vertical: AppSize.size20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    // ignore: prefer_const_constructors
                    TextCustom(
                      text: 'headtohead'.tr,
                      color: AppColors.black,
                      fontSize: AppSize.size16,
                      weight: FontFamily.semiBold,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children:  [
                    TextCustom(
                      text: 'win'.tr,
                      color: AppColors.black,
                    ),
                    TextCustom(
                      text: 'played'.tr,
                      color: AppColors.black,
                    ),
                    TextCustom(
                      text: 'win'.tr,
                      color: AppColors.black,
                    ),
                  ],
                ),
                const SizedBox(height: AppSize.size15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextCustom(
                        text: controller
                            .dataHeadToHead.dataResponse.firstTeamWins
                            .toString(),
                        color: AppColors.black,
                        fontSize: AppSize.size16,
                        weight: FontFamily.semiBold),
                    SizedBox(
                      width: AppSize.sizeWidthApp * 0.5,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                                height: AppSize.size10,
                                width: AppSize.sizeWidthApp * 0.2,
                                child: Row(
                                  children: [
                                    controller.dataHeadToHead.dataResponse
                                                .total !=
                                            0
                                        ? Container(
                                            height: AppSize.size10,
                                            width: AppSize.sizeWidthApp * 0.2 -
                                                (AppSize.sizeWidthApp * 0.2 -
                                                    AppSize.sizeWidthApp *
                                                        0.2 *
                                                        controller
                                                            .dataHeadToHead
                                                            .dataResponse
                                                            .secondTeamWins /
                                                        controller
                                                            .dataHeadToHead
                                                            .dataResponse
                                                            .total),
                                            color: AppColors.grey_f2f)
                                        : const SizedBox(),
                                    controller.dataHeadToHead.dataResponse
                                                .total !=
                                            0
                                        ? Container(
                                            height: AppSize.size10,
                                            width: AppSize.sizeWidthApp * 0.2 -
                                                (AppSize.sizeWidthApp *
                                                    0.2 *
                                                    controller
                                                        .dataHeadToHead
                                                        .dataResponse
                                                        .secondTeamWins /
                                                    controller.dataHeadToHead
                                                        .dataResponse.total),
                                            color: AppColors.red)
                                        : const SizedBox(),
                                  ],
                                )),
                            TextCustom(
                              text: controller.dataHeadToHead.dataResponse.total
                                  .toString(),
                              color: AppColors.black,
                              weight: FontFamily.semiBold,
                            ),
                            SizedBox(
                                height: AppSize.size10,
                                width: AppSize.sizeWidthApp * 0.2,
                                child: Row(
                                  children: [
                                    controller.dataHeadToHead.dataResponse
                                                .total !=
                                            0
                                        ? Container(
                                            height: AppSize.size10,
                                            width: AppSize.sizeWidthApp * 0.2 -
                                                (AppSize.sizeWidthApp *
                                                    0.2 *
                                                    controller
                                                        .dataHeadToHead
                                                        .dataResponse
                                                        .secondTeamWins /
                                                    controller.dataHeadToHead
                                                        .dataResponse.total),
                                            color: AppColors.blue_2D1)
                                        : const SizedBox(),
                                    controller.dataHeadToHead.dataResponse
                                                .total !=
                                            0
                                        ? Container(
                                            height: AppSize.size10,
                                            width: AppSize.sizeWidthApp * 0.2 -
                                                (AppSize.sizeWidthApp * 0.2 -
                                                    AppSize.sizeWidthApp *
                                                        0.2 *
                                                        controller
                                                            .dataHeadToHead
                                                            .dataResponse
                                                            .secondTeamWins /
                                                        controller
                                                            .dataHeadToHead
                                                            .dataResponse
                                                            .total),
                                            color: AppColors.grey_f2f)
                                        : const SizedBox(),
                                  ],
                                )),
                          ]),
                    ),
                    TextCustom(
                        text: controller
                            .dataHeadToHead.dataResponse.secondTeamWins
                            .toString(),
                        color: AppColors.black,
                        fontSize: AppSize.size16,
                        weight: FontFamily.semiBold)
                  ],
                ),
                const SizedBox(height: AppSize.size10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextCustom(text: 'drawn'.tr, color: AppColors.black),
                    TextCustom(
                      text: '  ',
                    ),
                    TextCustom(
                        text:
                            '${controller.dataHeadToHead.dataResponse.total - controller.dataHeadToHead.dataResponse.secondTeamWins - controller.dataHeadToHead.dataResponse.firstTeamWins}',
                        color: AppColors.black,
                        weight: FontFamily.semiBold),
                  ],
                ),
                const SizedBox(height: AppSize.size10),
                ItemStatsHeadToHead(
                  title: 'homewin'.tr,
                  resultIndex1: controller.dataHeadToHead.dataResponse.fHome,
                  resultIndex2: controller.dataHeadToHead.dataResponse.fAway,
                ),
                ItemStatsHeadToHead(
                  title: 'awaywin'.tr,
                  resultIndex1: controller.dataHeadToHead.dataResponse.sHome,
                  resultIndex2: controller.dataHeadToHead.dataResponse.sAway,
                ),
              ],
            ),
          ),
          Container(
            height: AppSize.size10,
            width: AppSize.sizeWidthApp,
            color: AppColors.grey_f2f,
          ),
          Container(
            color: AppColors.white,
            padding: const EdgeInsets.symmetric(
              horizontal: AppSize.size20,
              vertical: AppSize.size15,
            ),
            width: AppSize.sizeWidthApp,
            child: Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  [
                  // ignore: prefer_const_constructors
                  TextCustom(
                    text: 'previosRéuls'.tr,
                    color: AppColors.black,
                    fontSize: AppSize.size16,
                    weight: FontFamily.medium,
                  ),
                ],
              ),
              const SizedBox(height: AppSize.size10),
              if (controller
                  .dataHeadToHead.dataResponse.firstTeamVSSecondTeam.isEmpty)
                Center(
                  child: TextCustom(
                    text: 'Nevermetanopponent'.tr,
                    color: AppColors.black,
                  ),
                ),
              for (HeadToHeadItem result in controller
                  .dataHeadToHead.dataResponse.firstTeamVSSecondTeam)
                InkWell(
                  onTap: () => {
                    Get.offNamed(
                      AppRoutes.match,
                      arguments: {
                        'idHome': result.matchHometeamId,
                        'idAway': result.matchAwayteamId,
                        'date': result.matchDate,
                        'nameHome': result.matchHometeamName,
                        'nameAway': result.matchAwayteamName,
                        'matchId': result.matchId,
                      },
                      preventDuplicates: false,
                    ),
                  },
                  child: ItemStatsResuls(
                    nameTeam1: result.matchHometeamName,
                    nameTeam2: result.matchAwayteamName,
                    result1: result.matchHometeamScore,
                    result2: result.matchAwayteamScore,
                  ),
                ),
            ]),
          ),
          Container(
            height: AppSize.size10,
            width: AppSize.sizeWidthApp,
            color: AppColors.grey_f2f,
          ),
        ],
      ),
    );
  }
}
