import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:jiffy/jiffy.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/common/widgets/item_head_to_head.dart';
import 'package:worldcup_app/common/widgets/loading_base.dart';
import 'package:worldcup_app/config_app/config_app.dart';
import 'package:worldcup_app/home_page/controllers/fixtures_controller.dart';
import 'package:worldcup_app/models/fixture.dart';
import 'package:worldcup_app/models/flag.dart';

class FixturesResultsScreen extends GetView<FixturesController> {
  const FixturesResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: Obx(
        () => !controller.isLoading.value
            ? SafeArea(
                child: controller.dataFixture.error.isEmpty
                    ? Column(
                        children: [
                          HeaderBase(
                            text: 'Fixtures',
                            enable: false,
                          ),
                          Expanded(
                            child: SmartRefresher(
                              controller: controller.refreshController,
                              onRefresh: () =>
                                  controller.getFixtures(isReloading: true),
                              header: const ClassicHeader(
                                refreshStyle: RefreshStyle.Behind,
                                idleText: 'Refresh',
                                releaseText: 'Refresh',
                              ),
                              child: SingleChildScrollView(
                                physics: const BouncingScrollPhysics(),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    if (controller.isLive.value)
                                      Container(
                                        width: AppSize.sizeWidthApp,
                                        height: 220,
                                        margin: const EdgeInsets.symmetric(
                                          horizontal: AppSize.size10,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.purple,
                                          borderRadius: BorderRadius.circular(
                                            AppSize.size10,
                                          ),
                                        ),
                                        padding: const EdgeInsets.all(
                                            AppSize.size15),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  width: AppSize.size70,
                                                  height: AppSize.size30,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                    color: AppColors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      AppSize.size5,
                                                    ),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons
                                                            .fiber_manual_record,
                                                        color: AppColors.green,
                                                        size: AppSize.size15,
                                                      ),
                                                      const SizedBox(
                                                          width: AppSize.size5),
                                                      TextCustom(
                                                        text: 'Live',
                                                        color: AppColors.red,
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    TextCustom(
                                                      text: controller
                                                          .fixtureLive!
                                                          .value
                                                          .matchStadium,
                                                    ),
                                                    TextCustom(
                                                      text: controller
                                                          .fixtureLive!
                                                          .value
                                                          .stageName,
                                                      weight: FontFamily.medium,
                                                      color: AppColors.white
                                                          .withOpacity(.7),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: AppSize.size20),
                                            Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Column(
                                                  children: [
                                                    SvgPicture.asset(
                                                      Flag.allFlags[controller
                                                              .fixtureLive!
                                                              .value
                                                              .matchHometeamName] ??
                                                          'assets/svg/flag/be.svg',
                                                      height: AppSize.size50,
                                                    ),
                                                    SizedBox(
                                                        height: AppSize.size10),
                                                    TextCustom(
                                                      text: controller
                                                          .fixtureLive!
                                                          .value
                                                          .matchHometeamName,
                                                      weight: FontFamily.medium,
                                                    )
                                                  ],
                                                ),
                                                SizedBox(width: AppSize.size30),
                                                Column(
                                                  children: [
                                                    TextCustom(
                                                      text:
                                                          '${controller.fixtureLive!.value.matchHometeamScore} - ${controller.fixtureLive!.value.matchAwayteamScore}',
                                                      fontSize: AppSize.size40,
                                                      weight: FontFamily.medium,
                                                    ),
                                                    Container(
                                                      width: AppSize.size100,
                                                      height: AppSize.size40,
                                                      alignment:
                                                          Alignment.center,
                                                      decoration: BoxDecoration(
                                                        color: AppColors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(AppSize
                                                                    .size20),
                                                      ),
                                                      child: TextCustom(
                                                        text:
                                                            '${controller.fixtureLive!.value.matchStatus}',
                                                        color: AppColors.black,
                                                        fontSize:
                                                            AppSize.size14,
                                                        weight:
                                                            FontFamily.medium,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(width: AppSize.size30),
                                                Column(
                                                  children: [
                                                    SvgPicture.asset(
                                                      Flag.allFlags[controller
                                                              .fixtureLive!
                                                              .value
                                                              .matchAwayteamName] ??
                                                          'assets/svg/flag/be.svg',
                                                      height: AppSize.size50,
                                                    ),
                                                    SizedBox(
                                                        height: AppSize.size10),
                                                    TextCustom(
                                                      text: controller
                                                          .fixtureLive!
                                                          .value
                                                          .matchAwayteamName,
                                                      weight: FontFamily.medium,
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Spacer(),
                                            LinearProgressIndicator(
                                              color: AppColors.red,
                                              backgroundColor: AppColors.white,
                                            ),
                                          ],
                                        ),
                                      ),
                                    const SizedBox(height: AppSize.size30),
                                    for (var listFixture
                                        in controller.dataFixture.dataResponse)
                                      _buildBlocFixtures(context, listFixture),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : Center(
                        child: TextCustom(
                          text: ' ${controller.dataFixture.error}',
                          color: AppColors.black,
                        ),
                      ),
              )
            : const LoadingBase(),
      ),
    );
  }

  Widget _buildBlocFixtures(BuildContext context, List<Fixture> listFixture) {
    return Column(
      children: [
        const GradientLine(margin: AppSize.size10),
        Container(
          width: MediaQuery.of(context).size.width,
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
                    text: Jiffy(listFixture[0].matchDate).yMMMMEEEEd,
                    color: AppColors.black,
                    fontSize: AppSize.size16,
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
              for (var i = 0; i < listFixture.length; i++)
                _buildItemHeadToHead(
                  i,
                  listFixture.length,
                  listFixture[i],
                ),
            ],
          ),
        ),
        const SizedBox(height: AppSize.size30),
      ],
    );
  }

  Widget _buildItemHeadToHead(int index, int length, Fixture fixture) {
    return InkWell(
      onTap: () => Get.toNamed(
        AppRoutes.match,
        arguments: {
          'idHome': fixture.matchHometeamId,
          'idAway': fixture.matchAwayteamId,
          'date': fixture.matchDate,
          'nameHome': fixture.matchHometeamName,
          'nameAway': fixture.matchAwayteamName,
          'matchId': fixture.matchId,
        },
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(
              top: AppSize.size15,
              bottom: index != length ? AppSize.size15 : AppSize.size0,
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                ItemHeadToHead(
                  fixture: fixture,
                  isResult: fixture.matchStatus == 'Finished' ? true : false,
                  sizeTextFlag: AppSize.size12,
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSize.size12,
                    vertical: AppSize.size5,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Spacer(),
                    SvgPicture.asset(
                      'assets/svg/arrow_right.svg',
                      color: AppColors.black.withOpacity(.8),
                      width: AppSize.size18,
                    ),
                  ],
                )
              ],
            ),
          ),
          if (index != length)
            Divider(
              height: AppSize.size0,
              color: AppColors.grey_f2f,
              thickness: AppSize.size1,
            ),
        ],
      ),
    );
  }
}
