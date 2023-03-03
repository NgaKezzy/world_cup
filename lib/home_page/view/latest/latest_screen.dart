import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:jiffy/jiffy.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:worldcup_app/2048/main.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/common/controller/main_controller.dart';
import 'package:worldcup_app/common/widgets/item_head_to_head.dart';
import 'package:worldcup_app/common/widgets/item_new_video.dart';
import 'package:worldcup_app/common/widgets/loading_base.dart';
import 'package:worldcup_app/config_app/app_api.dart';
import 'package:worldcup_app/config_app/config_app.dart';
import 'package:worldcup_app/details_news/view/details_news.dart';
import 'package:worldcup_app/flappybird/Core/game_main.dart';
import 'package:worldcup_app/news/view/latest_new.dart';
import 'package:worldcup_app/latest_video/view/latest_videos.dart';
import 'package:worldcup_app/home_page/controllers/main_home_controller.dart';
import 'package:worldcup_app/home_page/view/fixtures/view/fixtures_results_screen.dart';
import 'package:worldcup_app/home_page/controllers/latest_home_controller.dart';
import 'package:worldcup_app/home_page/view/widgets/favorite_team.dart';
import 'package:worldcup_app/models/fixture.dart';
import 'package:worldcup_app/models/flag.dart';
import 'package:worldcup_app/models/ranking/ranking_item.dart';
import 'package:worldcup_app/player_video/view/player_video_screen.dart';
import 'package:worldcup_app/services/api/google_ads_api.dart';
import 'package:worldcup_app/services/storage/local_storage_service.dart';

class LatestScreen extends GetView<LatestHomeController> {
  const LatestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      withScaffold: false,
      child: Obx(
        () => controller.isLoading.value
            ? const LoadingBase()
            : SafeArea(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: SmartRefresher(
                    controller: controller.refreshController,
                    onRefresh: () => controller.getAll(isReloading: true),
                    header: const ClassicHeader(
                      refreshStyle: RefreshStyle.Behind,
                      idleText: 'Refresh',
                      releaseText: 'Refresh',
                    ),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          const SizedBox(height: AppSize.size30),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: AppSize.size10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Logo(
                                  height: AppSize.size30,
                                ),
                              ],
                            ),
                          ),
                          if (controller.isLive.value)
                            SizedBox(height: AppSize.size25),
                          if (controller.isLive.value)
                            Container(
                              width: AppSize.sizeWidthApp,
                              height: 220,
                              margin: const EdgeInsets.symmetric(
                                horizontal: AppSize.size10,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.purple,
                                borderRadius: BorderRadius.circular(
                                  AppSize.size10,
                                ),
                              ),
                              padding: const EdgeInsets.all(AppSize.size15),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: AppSize.size70,
                                        height: AppSize.size30,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: AppColors.white,
                                          borderRadius: BorderRadius.circular(
                                            AppSize.size5,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.fiber_manual_record,
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
                                            text: controller.fixtureLive!.value
                                                .matchStadium,
                                          ),
                                          TextCustom(
                                            text: controller
                                                .fixtureLive!.value.stageName,
                                            weight: FontFamily.medium,
                                            color:
                                                AppColors.white.withOpacity(.7),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: AppSize.size20),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                          SizedBox(height: AppSize.size10),
                                          TextCustom(
                                            text: controller.fixtureLive!.value
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
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                              color: AppColors.white,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      AppSize.size20),
                                            ),
                                            child: TextCustom(
                                              text:
                                                  '${controller.fixtureLive!.value.matchStatus}\'',
                                              color: AppColors.black,
                                              fontSize: AppSize.size14,
                                              weight: FontFamily.medium,
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
                                          SizedBox(height: AppSize.size10),
                                          TextCustom(
                                            text: controller.fixtureLive!.value
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
                          if (controller.listDuDoan.value.isNotEmpty)
                            const SizedBox(height: AppSize.size25),
                          if (controller.listDuDoan.value.isNotEmpty)
                            Container(
                              margin: EdgeInsets.only(left: AppSize.size20),
                              child: Row(
                                children: [
                                  TextCustom(
                                    text: 'PredictTheOutcome'.tr,
                                    fontSize: AppSize.size16,
                                    weight: FontFamily.medium,
                                  ),
                                ],
                              ),
                            ),
                          if (controller.listDuDoan.value.isNotEmpty)
                            const SizedBox(height: AppSize.size10),
                          if (controller.listDuDoan.value.isNotEmpty)
                            CarouselSlider(
                              options: CarouselOptions(
                                height: 250,
                                viewportFraction: 0.8,
                                enableInfiniteScroll: false,
                              ),
                              items: [
                                for (var i = 0;
                                    i < controller.listDuDoan.value.length;
                                    i++)
                                  Container(
                                    width: double.infinity,
                                    margin: EdgeInsets.only(
                                      right: AppSize.size10,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(
                                        AppSize.size10,
                                      ),
                                    ),
                                    padding: EdgeInsets.all(AppSize.size15),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        TextCustom(
                                          text: 'WhichTeamWin'.tr,
                                          fontSize: AppSize.size16,
                                          weight: FontFamily.medium,
                                          color: AppColors.black,
                                          align: TextAlign.center,
                                        ),
                                        const SizedBox(height: AppSize.size10),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Column(
                                              children: [
                                                SvgPicture.asset(
                                                  Flag.allFlags[controller
                                                          .listDuDoan
                                                          .value[i]
                                                          .matchHometeamName] ??
                                                      'assets/svg/flag/be.svg',
                                                  height: AppSize.size40,
                                                ),
                                                SizedBox(
                                                    height: AppSize.size10),
                                                TextCustom(
                                                  text: controller
                                                      .listDuDoan
                                                      .value[i]
                                                      .matchHometeamName,
                                                  weight: FontFamily.medium,
                                                  color: AppColors.black,
                                                )
                                              ],
                                            ),
                                            SizedBox(width: AppSize.size30),
                                            Column(
                                              children: [
                                                TextCustom(
                                                  text: '-',
                                                  fontSize: AppSize.size40,
                                                  weight: FontFamily.medium,
                                                  color: AppColors.black,
                                                ),
                                                SizedBox(
                                                    height: AppSize.size20),
                                              ],
                                            ),
                                            SizedBox(width: AppSize.size30),
                                            Column(
                                              children: [
                                                SvgPicture.asset(
                                                  Flag.allFlags[controller
                                                          .listDuDoan
                                                          .value[i]
                                                          .matchAwayteamName] ??
                                                      'assets/svg/flag/be.svg',
                                                  height: AppSize.size40,
                                                ),
                                                SizedBox(
                                                    height: AppSize.size10),
                                                TextCustom(
                                                  text: controller
                                                      .listDuDoan
                                                      .value[i]
                                                      .matchAwayteamName,
                                                  weight: FontFamily.medium,
                                                  color: AppColors.black,
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: AppSize.size20),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            for (var j = 0;
                                                j <
                                                    controller.listKQDuDoan
                                                        .value.length;
                                                j++)
                                              InkWell(
                                                onTap: () => controller
                                                    .onClickChooseDuDoan(
                                                        i, j + 1),
                                                child: Container(
                                                  width: AppSize.size80,
                                                  height: AppSize.size40,
                                                  decoration: BoxDecoration(
                                                    color: controller
                                                                .listKQDuDoan
                                                                .value[i] ==
                                                            j + 1
                                                        ? AppColors.green
                                                        : AppColors.grey_f2f,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            AppSize.size15),
                                                  ),
                                                  alignment: Alignment.center,
                                                  child: TextCustom(
                                                    text: j == 1
                                                        ? 'draw'.tr
                                                        : 'winP'.tr,
                                                    color: controller
                                                                .listKQDuDoan
                                                                .value[i] ==
                                                            j + 1
                                                        ? AppColors.white
                                                        : AppColors.black,
                                                    weight: FontFamily.medium,
                                                  ),
                                                ),
                                              ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                              ],
                            ),
                          if (controller.listDuDoan.value.isNotEmpty)
                            const SizedBox(height: AppSize.size25),
                          // if (controller.listHighLight.isNotEmpty)
                          //   InkWell(
                          //     onTap: () => Get.to(
                          //       () => DetailsNewsScreen(
                          //         news: controller.listNews[0],
                          //       ),
                          //     ),
                          //     child: Column(
                          //       children: [
                          //         Container(
                          //           height: 260,
                          //           padding: const EdgeInsets.symmetric(
                          //               horizontal: AppSize.size10),
                          //           child: CachedNetworkImage(
                          //             imageUrl: controller.listNews[0].imageUrl,
                          //             fit: BoxFit.cover,
                          //           ),
                          //         ),
                          //         const GradientLine(),
                          //         const SizedBox(height: AppSize.size10),
                          //         Container(
                          //           width: MediaQuery.of(context).size.width,
                          //           padding: const EdgeInsets.symmetric(
                          //               horizontal: AppSize.size25),
                          //           child: Column(
                          //             crossAxisAlignment:
                          //                 CrossAxisAlignment.start,
                          //             children: [
                          //               TextCustom(
                          //                 text: controller.listNews[0].type,
                          //                 color: AppColors.pink,
                          //                 fontStyle: FontFamily.italic,
                          //                 weight: FontFamily.medium,
                          //                 fontSize: AppSize.size10,
                          //               ),
                          //               const SizedBox(height: AppSize.size5),
                          //               TextCustom(
                          //                 text: controller.listNews[0].title,
                          //                 weight: FontFamily.semiBold,
                          //                 fontSize: AppSize.size18,
                          //                 height: 1.2,
                          //               ),
                          //               const SizedBox(height: AppSize.size5),
                          //               TextCustom(
                          //                 text: controller
                          //                     .listNews[0].description,
                          //                 fontSize: AppSize.size10,
                          //                 color:
                          //                     AppColors.white.withOpacity(0.8),
                          //               )
                          //             ],
                          //           ),
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // const SizedBox(height: AppSize.size15),
                          // Container(
                          //   padding: const EdgeInsets.symmetric(
                          //       horizontal: AppSize.size10),
                          //   child: Column(
                          //     children: [
                          //       for (var i = 1;
                          //           i < controller.listNews.length;
                          //           i++)
                          //         ItemNewsVideo(
                          //           highLight: controller.listNews[i],
                          //           isShowAd: false,
                          //           isVideo: false,
                          //           isClub: true,
                          //           textMore: controller.listNews[i].type,
                          //         ),
                          //     ],
                          //   ),
                          // ),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextCustom(
                                      text: 'match'.tr,
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
                                if (controller.dataFixture.error.isEmpty)
                                  for (var i = 0;
                                      i <
                                          (controller.dataFixture.dataResponse
                                                      .length <
                                                  3
                                              ? controller.dataFixture
                                                  .dataResponse.length
                                              : 3);
                                      i++)
                                    _buildBlockHeadToHead(
                                        controller.dataFixture.dataResponse[i])
                                else
                                  TextCustom(
                                    text: '${controller.dataFixture.error}',
                                    color: AppColors.black,
                                  ),
                                const Divider(
                                  height: 0,
                                  thickness: AppSize.size2,
                                  color: AppColors.grey_f2f,
                                ),
                                Container(
                                  padding: const EdgeInsets.only(
                                    top: AppSize.size10,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Spacer(),
                                      InkWell(
                                        onTap: () {
                                          MainHomeController
                                              controllerMainHome = Get.find();
                                          controllerMainHome.onTapped(2);
                                        },
                                        child: Row(
                                          children: [
                                            TextCustomNotAutoScale(
                                              text: 'AllFixtures'.tr,
                                              color: AppColors.black,
                                              fontSize: AppSize.size13,
                                              weight: FontFamily.medium,
                                            ),
                                            const SizedBox(
                                                width: AppSize.size5),
                                            SvgPicture.asset(
                                              'assets/svg/arrow_right.svg',
                                              color: AppColors.black
                                                  .withOpacity(.8),
                                              width: AppSize.size18,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: AppSize.size30),
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    TextCustom(
                                      text: controller
                                              .dataStanding.error.isEmpty
                                          ? 'Table - ${controller.dataStanding.dataResponse[0].leagueRound}'
                                          : 'Table',
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
                                              color: AppColors.black
                                                  .withOpacity(.7),
                                              weight: FontFamily.medium,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 4,
                                        child: SizedBox(
                                          child: Center(
                                            child: TextCustom(
                                              text: 'Country',
                                              color: AppColors.black
                                                  .withOpacity(.7),
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
                                              text: 'P',
                                              color: AppColors.black
                                                  .withOpacity(.7),
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
                                              color: AppColors.black
                                                  .withOpacity(.7),
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
                                              color: AppColors.black
                                                  .withOpacity(.7),
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
                                          for (var i = 0; i < 4; i++)
                                            _buildItemRank(
                                                controller.dataStanding
                                                    .dataResponse[i],
                                                i)
                                        ],
                                      )
                                    : Center(
                                        child: TextCustom(
                                          text: controller.dataStanding.error,
                                          color: AppColors.black,
                                        ),
                                      ),
                                Container(
                                  padding: const EdgeInsets.only(
                                    top: AppSize.size10,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Spacer(),
                                      InkWell(
                                        onTap: () =>
                                            Get.toNamed(AppRoutes.ranking),
                                        child: Row(
                                          children: [
                                            TextCustomNotAutoScale(
                                              text: 'FullTable'.tr,
                                              color: AppColors.black,
                                              fontSize: AppSize.size13,
                                              weight: FontFamily.medium,
                                            ),
                                            const SizedBox(
                                                width: AppSize.size5),
                                            SvgPicture.asset(
                                              'assets/svg/arrow_right.svg',
                                              color: AppColors.black
                                                  .withOpacity(.8),
                                              width: AppSize.size18,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(height: AppSize.size30),
                          const GradientLine(margin: AppSize.size10),
                          Container(
                            padding: const EdgeInsets.all(AppSize.size10),
                            color: AppColors.white,
                            child: Column(
                              children: [
                                if (LocalStorageService()
                                        .getString('favTeam') !=
                                    null)
                                  const FavouriteTeam(),
                                const SizedBox(height: AppSize.size10),
                                for (var i = 0;
                                    i < controller.listTeamNews.length;
                                    i++)
                                  ItemNewsVideo(
                                    highLight: controller.listHighLight[i],
                                    isShowAd: false,
                                    isVideo: false,
                                    textColor: AppColors.black,
                                  ),
                                const Divider(
                                  height: AppSize.size0,
                                  color: AppColors.grey_f2f,
                                  thickness: AppSize.size2,
                                ),
                                if (controller.listTeamNews.isNotEmpty)
                                  InkWell(
                                    onTap: () => Get.toNamed(
                                      AppRoutes.latestNews,
                                      arguments: {
                                        'team': LocalStorageService()
                                            .getString('favTeamName')!
                                      },
                                    ),
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                        top: AppSize.size15,
                                        bottom: AppSize.size5,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Spacer(),
                                          Row(
                                            children: [
                                              TextCustomNotAutoScale(
                                                text:
                                                    'More ${LocalStorageService().getString('favTeamName') ?? ''} News',
                                                color: AppColors.black,
                                                fontSize: AppSize.size13,
                                                weight: FontFamily.medium,
                                              ),
                                              const SizedBox(
                                                  width: AppSize.size5),
                                              SvgPicture.asset(
                                                'assets/svg/arrow_right.svg',
                                                color: AppColors.black
                                                    .withOpacity(.8),
                                                width: AppSize.size18,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          const SizedBox(height: AppSize.size30),
                          const GradientLine(margin: AppSize.size10),
                          Container(
                            color: AppColors.white,
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppSize.size10,
                              vertical: AppSize.size15,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    TextCustom(
                                      text: 'latestVideo'.tr,
                                      color: AppColors.black,
                                      fontSize: AppSize.size18,
                                      weight: FontFamily.medium,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: AppSize.size15),
                                const Divider(
                                  height: AppSize.size0,
                                  thickness: AppSize.size2,
                                  color: AppColors.grey_f2f,
                                ),
                                const SizedBox(height: AppSize.size15),
                                for (var i = 0;
                                    i < controller.listHighLight.length;
                                    i++)
                                  ItemNewsVideo(
                                    highLight: controller.listHighLight[i],
                                    isShowAd: false,
                                    textColor: AppColors.black,
                                  ),
                                if (controller.listHighLight.isEmpty)
                                  Center(
                                    child: TextCustom(
                                      text: 'CurrentNo'.tr,
                                      color: AppColors.black,
                                    ),
                                  ),
                                if (controller.listHighLight.isEmpty)
                                  const SizedBox(height: AppSize.size15),
                                const Divider(
                                  height: AppSize.size0,
                                  color: AppColors.grey_f2f,
                                  thickness: AppSize.size2,
                                ),
                                Container(
                                  padding: const EdgeInsets.only(
                                    top: AppSize.size15,
                                    bottom: AppSize.size5,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Spacer(),
                                      GestureDetector(
                                        onTap: () =>
                                            Get.toNamed(AppRoutes.latestVideo),
                                        child: Row(
                                          children: [
                                            TextCustomNotAutoScale(
                                              text: 'AllVideo'.tr,
                                              color: AppColors.black,
                                              fontSize: AppSize.size13,
                                              weight: FontFamily.medium,
                                            ),
                                            const SizedBox(
                                                width: AppSize.size5),
                                            SvgPicture.asset(
                                              'assets/svg/arrow_right.svg',
                                              color: AppColors.black
                                                  .withOpacity(.8),
                                              width: AppSize.size18,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: AppSize.size30),
                          const GradientLine(margin: AppSize.size10),
                          Container(
                            color: AppColors.white,
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppSize.size10,
                              vertical: AppSize.size15,
                            ),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    TextCustom(
                                      text: 'latestNew'.tr,
                                      color: AppColors.black,
                                      fontSize: AppSize.size18,
                                      weight: FontFamily.medium,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: AppSize.size15),
                                const Divider(
                                  height: AppSize.size0,
                                  thickness: AppSize.size2,
                                  color: AppColors.grey_f2f,
                                ),
                                const SizedBox(height: AppSize.size15),
                                for (var i = 0;
                                    i < controller.listNews.length;
                                    i++)
                                  ItemNewsVideo(
                                    textColor: AppColors.black,
                                    isClub: true,
                                    textMore: controller.listNews[i].type,
                                    isVideo: false,
                                    highLight: controller.listNews[i],
                                  ),
                                if (controller.listNews.isEmpty)
                                  Center(
                                    child: TextCustom(
                                      text: 'CurrentNo'.tr,
                                      color: AppColors.black,
                                    ),
                                  ),
                                if (controller.listNews.isEmpty)
                                  const SizedBox(height: AppSize.size15),
                                const Divider(
                                  height: AppSize.size0,
                                  color: AppColors.grey_f2f,
                                  thickness: AppSize.size2,
                                ),
                                Container(
                                  padding: const EdgeInsets.only(
                                    top: AppSize.size15,
                                    bottom: AppSize.size5,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const Spacer(),
                                      GestureDetector(
                                        onTap: () => Get.to(
                                          () => LatestNew(),
                                          transition:
                                              Transition.rightToLeftWithFade,
                                          duration:
                                              const Duration(milliseconds: 600),
                                        ),
                                        child: Row(
                                          children: [
                                            InkWell(
                                              onTap: () => Get.toNamed(
                                                AppRoutes.latestNews,
                                                arguments: {'team': ''},
                                              ),
                                              child: TextCustomNotAutoScale(
                                                text: 'AllNew'.tr,
                                                color: AppColors.black,
                                                fontSize: AppSize.size13,
                                                weight: FontFamily.medium,
                                              ),
                                            ),
                                            const SizedBox(
                                                width: AppSize.size5),
                                            SvgPicture.asset(
                                              'assets/svg/arrow_right.svg',
                                              color: AppColors.black
                                                  .withOpacity(.8),
                                              width: AppSize.size18,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: AppSize.size0),
                              ],
                            ),
                          ),
                          const SizedBox(height: AppSize.size40),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
      ),
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
                      fontSize: AppSize.size16,
                      color: AppColors.black,
                      weight: FontFamily.medium,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.fiber_manual_record,
                        size: AppSize.size15,
                        color: AppColors.grey_f2f,
                      ),
                      const SizedBox(width: AppSize.size15),
                      SvgPicture.asset(
                        Flag.allFlags[itemRanking.teamName] ??
                            'assets/svg/flag/vn.svg',
                        height: AppSize.size20,
                      ),
                      const SizedBox(width: AppSize.size15),
                      TextCustom(
                        text: itemRanking.teamName,
                        color: AppColors.black,
                        weight: FontFamily.medium,
                        fontSize: AppSize.size14,
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
                      fontSize: AppSize.size16,
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
                      fontSize: AppSize.size16,
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
                      fontSize: AppSize.size16,
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

  Widget _buildBlockHeadToHead(List<Fixture> listFixture) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: AppSize.size12,
            vertical: AppSize.size6,
          ),
          color: AppColors.grey_f2f,
          child: TextCustomNotAutoScale(
            text: Jiffy(listFixture[0].matchDate).yMMMMEEEEd,
            fontSize: AppSize.size12,
            color: AppColors.black.withOpacity(0.9),
          ),
        ),
        for (var i = 0; i < listFixture.length; i++)
          _buildItemHeadToHead(i, listFixture.length, listFixture[i]),
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
                  sizeTextFlag: AppSize.size10,
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
            const Divider(
              height: AppSize.size0,
              color: AppColors.grey_f2f,
              thickness: AppSize.size1,
            ),
        ],
      ),
    );
  }
}
