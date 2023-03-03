import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/common/widgets/loading_base.dart';
import 'package:worldcup_app/config_app/config_app.dart';
import 'package:worldcup_app/models/flag.dart';
import 'package:worldcup_app/models/ranking/ranking_item.dart';
import 'package:worldcup_app/ranking/controllers/ranking_controller.dart';

class RankingScreen extends GetView<RankingController> {
  const RankingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: Obx(
        () => controller.isLoading.value
            ? const LoadingBase()
            : SafeArea(
                child: Column(
                  children: [
                    HeaderBase(
                      text: 'tables'.tr,
                      onTap: () => Get.back(),
                    ),
                    Expanded(
                      child: SmartRefresher(
                        controller: controller.refreshController,
                        onRefresh: () =>
                            controller.getStandings(isReloading: true),
                        header: const ClassicHeader(
                          refreshStyle: RefreshStyle.Behind,
                          idleText: 'Refresh',
                          releaseText: 'Refresh',
                        ),
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            children: [
                              Container(
                                width: AppSize.sizeHeightApp,
                                color: AppColors.white,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: AppSize.size10,
                                  vertical: AppSize.size15,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextCustomNotAutoScale(
                                      text: 'Competition',
                                      fontStyle: FontStyle.italic,
                                      color: AppColors.purple,
                                      fontSize: AppSize.size10,
                                      weight: FontFamily.medium,
                                    ),
                                    TextCustomNotAutoScale(
                                      text: 'Cup 2022',
                                      color: AppColors.black,
                                      weight: FontFamily.medium,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: AppSize.size30),
                              for (var listRanking
                                  in controller.dataStanding.dataResponse)
                                _builListTable(listRanking),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  Widget _builListTable(List<RankingItem> listRaking) {
    return Column(
      children: [
        const GradientLine(
          margin: AppSize.size10,
        ),
        Container(
          width: AppSize.sizeHeightApp,
          color: AppColors.white,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSize.size10,
            vertical: AppSize.size15,
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextCustom(
                    text: controller.dataStanding.error.isEmpty
                        ? 'WC Table - ${listRaking[0].leagueRound}'
                        : 'WC Table',
                    color: AppColors.black,
                    fontSize: AppSize.size18,
                    weight: FontFamily.medium,
                  ),
                  SvgPicture.asset(
                    'assets/svg/king.svg',
                    width: AppSize.size30,
                    color: AppColors.red_99,
                  )
                ],
              ),
              const SizedBox(height: AppSize.size15),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSize.size12,
                  vertical: AppSize.size6,
                ),
                color: AppColors.grey_f2f,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        child: Center(
                          child: TextCustom(
                            text: 'Pos',
                            color: AppColors.black.withOpacity(.7),
                            weight: FontFamily.medium,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: SizedBox(
                        child: Center(
                          child: TextCustom(
                            text: 'Country',
                            color: AppColors.black.withOpacity(.7),
                            weight: FontFamily.medium,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        child: Center(
                          child: TextCustom(
                            text: 'PL',
                            color: AppColors.black.withOpacity(.7),
                            weight: FontFamily.medium,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        child: Center(
                          child: TextCustom(
                            text: 'W',
                            color: AppColors.black.withOpacity(.7),
                            weight: FontFamily.medium,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        child: Center(
                          child: TextCustom(
                            text: 'D',
                            color: AppColors.black.withOpacity(.7),
                            weight: FontFamily.medium,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        child: Center(
                          child: TextCustom(
                            text: 'L',
                            color: AppColors.black.withOpacity(.7),
                            weight: FontFamily.medium,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        child: Center(
                          child: TextCustom(
                            text: 'GD',
                            color: AppColors.black.withOpacity(.7),
                            weight: FontFamily.medium,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        child: Center(
                          child: TextCustom(
                            text: 'Pts',
                            color: AppColors.black.withOpacity(.7),
                            weight: FontFamily.medium,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              controller.dataStanding.error.isEmpty
                  ? Column(
                      children: [
                        for (var i = 0; i < listRaking.length; i++)
                          _buildItemRank(listRaking[i], i)
                      ],
                    )
                  : Center(
                      child: TextCustom(
                        text: controller.dataStanding.error,
                      ),
                    ),
            ],
          ),
        ),
        const SizedBox(height: AppSize.size15),
      ],
    );
  }

  Widget _buildItemRank(RankingItem itemRanking, int index) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSize.size12,
            vertical: AppSize.size15,
          ),
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: SizedBox(
                  child: Center(
                    child: TextCustom(
                      text: itemRanking.overallLeaguePosition,
                      fontSize: AppSize.size13,
                      color: AppColors.black,
                      weight: FontFamily.medium,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.fiber_manual_record,
                        size: AppSize.size15,
                        color: AppColors.grey_f2f,
                      ),
                      const SizedBox(width: AppSize.size15),
                      SvgPicture.asset(
                        Flag.allFlags[itemRanking.teamName]!,
                        height: AppSize.size16,
                      ),
                      const SizedBox(width: AppSize.size10),
                      TextCustomNotAutoScale(
                        text: itemRanking.teamName,
                        color: AppColors.black,
                        weight: FontFamily.medium,
                        fontSize: AppSize.size12,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: SizedBox(
                  child: Center(
                    child: TextCustom(
                      text: itemRanking.overallLeaguePayed,
                      color: AppColors.black,
                      fontSize: AppSize.size13,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: SizedBox(
                  child: Center(
                    child: TextCustom(
                      text: itemRanking.overallLeagueW,
                      color: AppColors.black,
                      fontSize: AppSize.size13,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: SizedBox(
                  child: Center(
                    child: TextCustom(
                      text: itemRanking.overallLeagueD,
                      color: AppColors.black,
                      fontSize: AppSize.size13,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: SizedBox(
                  child: Center(
                    child: TextCustom(
                      text: itemRanking.overallLeagueL,
                      color: AppColors.black,
                      fontSize: AppSize.size13,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: SizedBox(
                  child: Center(
                    child: TextCustom(
                      text:
                          '${int.parse(itemRanking.overallLeagueGF) - int.parse(itemRanking.overallLeagueGA)}',
                      color: AppColors.black,
                      fontSize: AppSize.size13,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: SizedBox(
                  child: Center(
                    child: TextCustom(
                      text: itemRanking.overallLeaguePTS,
                      fontSize: AppSize.size13,
                      color: AppColors.black,
                      weight: FontFamily.medium,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Divider(
          height: AppSize.size0,
          color: AppColors.grey_f2f,
          thickness: index == 4 ? AppSize.size2 : AppSize.size1,
        ),
      ],
    );
  }
}
