import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:worldcup_app/app.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/common/controller/main_controller.dart';
import 'package:worldcup_app/common/widgets/loading_base.dart';
import 'package:worldcup_app/config_app/app_api.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_font.dart';
import 'package:worldcup_app/config_app/app_routes.dart';
import 'package:worldcup_app/config_app/app_size.dart';
import 'package:worldcup_app/detail_match/controllers/details_match_controller.dart';
import 'package:worldcup_app/home_page/view/worldcup/details_team_screen.dart';
import 'package:worldcup_app/home_page/view/worldcup/latest.dart';
import 'package:worldcup_app/home_page/view/worldcup/line_up.dart';
import 'package:worldcup_app/home_page/view/worldcup/related.dart';
import 'package:worldcup_app/home_page/view/worldcup/stats.dart';
import 'package:worldcup_app/models/fixture.dart';
import 'package:worldcup_app/models/flag.dart';

class MatchInfomation extends GetView<DetailsMatchController> {
  const MatchInfomation({super.key});

  @override
  Widget build(BuildContext context) {
    var data = Get.arguments;
    return BaseScreen(
      child: Obx(
        () => controller.isLoading.value
            ? const LoadingBase()
            : SafeArea(
                child: Column(
                  children: [
                    HeaderBase(
                      text: '${data['nameHome']} v ${data['nameAway']}',
                      onTap: () => Get.back(),
                      child: InkWell(
                        onTap: () {
                          MainController.showScheduleNotification(
                              title: 'TheMatchIsInProgress'.tr +
                                  ' ${data['nameHome']} vs ${data['nameAway']}',
                              body: controller
                                  .dataStatisticMatch.dataResponse[0].matchDate,
                              payload: '',
                              scheduledDate: DateTime.parse(
                                  '${controller.dataStatisticMatch.dataResponse[0].matchDate} ${controller.dataStatisticMatch.dataResponse[0].matchTime}'));
                          Fluttertoast.showToast(
                              msg: 'Timedsuccessfullyinthecalendar'.tr);
                        },
                        child: SvgPicture.asset(
                          'assets/svg/schedule.svg',
                          height: AppSize.size25,
                          color: AppColors.white,
                        ),
                      ),
                    ),
                    Expanded(
                      child: CustomScrollView(
                        slivers: [
                          SliverAppBar(
                            leading: const SizedBox(),
                            expandedHeight: 250.0,
                            flexibleSpace: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  height: 250,
                                  width: AppSize.sizeWidthApp,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('assets/images/s1.jpg'),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: AppSize.size0,
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: AppSize.size50,
                                    width: AppSize.sizeWidthApp,
                                    child: Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Get.toNamed(AppRoutes.detailsTeam,
                                                arguments: {
                                                  AppApi.teamId: controller
                                                      .dataStatisticMatch
                                                      .dataResponse[0]
                                                      .matchHometeamId,
                                                  AppApi.teamName: controller
                                                      .dataStatisticMatch
                                                      .dataResponse[0]
                                                      .matchHometeamName,
                                                });
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(
                                                AppSize.size5),
                                            height: AppSize.size50,
                                            width: AppSize.size50,
                                            color: AppColors.white,
                                            child: SvgPicture.asset(
                                              Flag.allFlags[controller
                                                      .dataStatisticMatch
                                                      .dataResponse[0]
                                                      .matchHometeamName] ??
                                                  'assets/svg/flag/vn.svg',
                                              height: AppSize.size20,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          padding: const EdgeInsets.only(
                                            left: 10,
                                            right: 10,
                                          ),
                                          height: AppSize.size50,
                                          width: AppSize.sizeWidthApp - 100,
                                          color: AppColors.purple,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: TextCustom(
                                                  text: controller
                                                      .dataStatisticMatch
                                                      .dataResponse[0]
                                                      .matchHometeamName,
                                                  fontSize: AppSize.size10,
                                                  weight: FontFamily.medium,
                                                  align: TextAlign.center,
                                                ),
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: controller
                                                            .dataStatisticMatch
                                                            .dataResponse[0]
                                                            .matchStatus ==
                                                        ''
                                                    ? Container(
                                                        height: AppSize.size50,
                                                        alignment:
                                                            Alignment.center,
                                                        child: TextCustom(
                                                          text: controller
                                                              .dataStatisticMatch
                                                              .dataResponse[0]
                                                              .matchDate,
                                                          weight:
                                                              FontFamily.bold,
                                                          fontSize:
                                                              AppSize.size16,
                                                          align:
                                                              TextAlign.center,
                                                        ),
                                                      )
                                                    : SizedBox(
                                                        width: AppSize
                                                                .sizeWidthApp *
                                                            0.15,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            TextCustom(
                                                                text: (controller
                                                                            .dataStatisticMatch
                                                                            .dataResponse[0]
                                                                        as Fixture)
                                                                    .matchHometeamScore,
                                                                fontSize:
                                                                    AppSize
                                                                        .size20,
                                                                weight: FontFamily
                                                                    .semiBold),
                                                            TextCustom(
                                                                text: ' - ',
                                                                fontSize:
                                                                    AppSize
                                                                        .size20,
                                                                weight: FontFamily
                                                                    .semiBold),
                                                            TextCustom(
                                                                text: (controller
                                                                            .dataStatisticMatch
                                                                            .dataResponse[0]
                                                                        as Fixture)
                                                                    .matchAwayteamScore,
                                                                fontSize:
                                                                    AppSize
                                                                        .size20,
                                                                weight: FontFamily
                                                                    .semiBold),
                                                          ],
                                                        ),
                                                      ),
                                              ),
                                              Expanded(
                                                child: TextCustom(
                                                  text: controller
                                                      .dataStatisticMatch
                                                      .dataResponse[0]
                                                      .matchAwayteamName,
                                                  fontSize: AppSize.size10,
                                                  weight: FontFamily.medium,
                                                  align: TextAlign.center,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Get.toNamed(AppRoutes.detailsTeam,
                                                arguments: {
                                                  AppApi.teamId: controller
                                                      .dataStatisticMatch
                                                      .dataResponse[0]
                                                      .matchAwayteamId,
                                                  AppApi.teamName: controller
                                                      .dataStatisticMatch
                                                      .dataResponse[0]
                                                      .matchAwayteamName,
                                                });
                                          },
                                          child: Container(
                                            padding: const EdgeInsets.all(
                                                AppSize.size5),
                                            height: AppSize.size50,
                                            width: AppSize.size50,
                                            color: AppColors.white,
                                            child: SvgPicture.asset(
                                              Flag.allFlags[controller
                                                      .dataStatisticMatch
                                                      .dataResponse[0]
                                                      .matchAwayteamName] ??
                                                  'assets/svg/flag/vn.svg',
                                              height: AppSize.size20,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          SliverFillRemaining(
                            child: DefaultTabController(
                              length: controller.dataStatisticMatch
                                          .dataResponse[0].matchStatus !=
                                      ''
                                  ? 4
                                  : 3,
                              child: Column(
                                children: [
                                  Container(
                                    color: AppColors.white,
                                    child: TabBar(
                                      unselectedLabelStyle:
                                          AppStyleCustom.getTextStyle(),
                                      labelStyle: AppStyleCustom.getTextStyle(
                                        weight: FontFamily.medium,
                                      ),
                                      labelColor: AppColors.black,
                                      tabs: [
                                        if (controller.dataStatisticMatch
                                                .dataResponse[0].matchStatus !=
                                            '')
                                          Tab(
                                            text: 'latest'.tr,
                                          ),
                                        Tab(
                                          text: 'stats'.tr,
                                        ),
                                        Tab(
                                          text: 'lineup'.tr,
                                        ),
                                        Tab(
                                          text: 'related'.tr,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: TabBarView(
                                      children: [
                                        if (controller.dataStatisticMatch
                                                .dataResponse[0].matchStatus !=
                                            '')
                                          Latest(),
                                        Stats(),
                                        LineUp(),
                                        Related(),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
