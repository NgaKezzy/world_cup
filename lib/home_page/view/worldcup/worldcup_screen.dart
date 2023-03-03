import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/common/widgets/item_head_to_head.dart';
import 'package:worldcup_app/common/widgets/item_new_video.dart';
import 'package:worldcup_app/common/widgets/loading_base.dart';
import 'package:worldcup_app/config_app/config_app.dart';
import 'package:worldcup_app/home_page/controllers/main_home_controller.dart';
import 'package:worldcup_app/home_page/controllers/worldcup_controller.dart';
import 'package:worldcup_app/home_page/view/widgets/favorite_team.dart';
import 'package:worldcup_app/home_page/view/worldcup/player/widgets/item_firstteam_player.dart';
import 'package:worldcup_app/home_page/view/worldcup/widgets/header_squad.dart';
import 'package:worldcup_app/home_page/view/worldcup/widgets/item_row_team.dart';
import 'package:worldcup_app/models/fixture.dart';
import 'package:worldcup_app/models/flag.dart';
import 'package:worldcup_app/models/player/player.dart' as pl;
import 'package:worldcup_app/models/team/team.dart';
import 'package:worldcup_app/news/view/latest_new.dart';
import 'package:worldcup_app/services/storage/local_storage_service.dart';
import 'package:worldcup_app/teams/view/teams_screen.dart';
import 'package:get/get.dart';

class WorldCupScreen extends GetView<WorldCupController> {
  const WorldCupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> labelButton = ['Team'.tr];
    List<Function()?> listFunc = [
      () => Get.toNamed(AppRoutes.teams),
    ];
    return DefaultTabController(
      length: 2,
      child: BaseScreen(
        withScaffold: false,
        child: Obx(
          () => controller.isLoading.value
              ? const LoadingBase()
              : SafeArea(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSize.size10,
                            vertical: AppSize.size30,
                          ),
                          child: const Align(
                            alignment: Alignment.centerLeft,
                            child: TextCustom(
                              text: 'Teams',
                              fontSize: AppSize.size28,
                              weight: FontFamily.semiBold,
                            ),
                          ),
                        ),

                        if (LocalStorageService().isExistKey('favTeam'))
                          Container(
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppSize.size10,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextCustom(
                                  text:
                                      '${LocalStorageService().getString('favTeamName')} Matches',
                                  fontSize: AppSize.size16,
                                  weight: FontFamily.medium,
                                ),
                                const SizedBox(height: AppSize.size20),
                                CarouselSlider(
                                  options: CarouselOptions(
                                    height: AppSize.size110,
                                    viewportFraction: 0.9,
                                    enableInfiniteScroll: false,
                                  ),
                                  items: controller.dataFixture.dataResponse
                                      .map<Widget>((Fixture fixture) {
                                    return Builder(
                                      builder: (BuildContext context) {
                                        return InkWell(
                                          onTap: () => Get.toNamed(
                                            AppRoutes.match,
                                            arguments: {
                                              'idHome': fixture.matchHometeamId,
                                              'idAway': fixture.matchAwayteamId,
                                              'date': fixture.matchDate,
                                              'nameHome':
                                                  fixture.matchHometeamName,
                                              'nameAway':
                                                  fixture.matchAwayteamName,
                                              'matchId': fixture.matchId,
                                            },
                                          ),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            padding: const EdgeInsets.symmetric(
                                                vertical: AppSize.size15),
                                            margin: const EdgeInsets.only(
                                              right: AppSize.size5,
                                            ),
                                            decoration: BoxDecoration(
                                              color: AppColors.purple,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      AppSize.size4),
                                            ),
                                            child: Column(
                                              children: [
                                                TextCustom(
                                                  text: fixture.matchDate,
                                                  weight: FontFamily.medium,
                                                ),
                                                const SizedBox(
                                                    height: AppSize.size15),
                                                ItemHeadToHead(
                                                  textColor: AppColors.white,
                                                  sizeFlag: AppSize.size18,
                                                  sizeTextFlag: AppSize.size10,
                                                  sizeTextTime: AppSize.size10,
                                                  fixture: fixture,
                                                  isResult:
                                                      fixture.matchStatus ==
                                                              'Finished'
                                                          ? true
                                                          : false,
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  }).toList(),
                                )
                              ],
                            ),
                          ),
                        if (LocalStorageService().isExistKey('favTeam'))
                          const SizedBox(height: AppSize.size20),
                        if (LocalStorageService().isExistKey('favTeam'))
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: AppSize.size10),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(AppSize.size5),
                              color: AppColors.white,
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: AppSize.size10,
                              horizontal: AppSize.size10,
                            ),
                            child: FavouriteTeam(),
                          ),
                        if (LocalStorageService().isExistKey('favTeam'))
                          const SizedBox(height: AppSize.size10),
                        if (LocalStorageService().isExistKey('favTeam'))
                          InkWell(
                            onTap: () {
                              MainHomeController mainHomeController =
                                  Get.find();
                              mainHomeController.onTapped(2);
                            },
                            child: _builBlocBase(
                              content: _buildBlockTable(
                                fixture: controller.dataFixture.dataResponse[0],
                                isResult: (controller.dataFixture
                                                .dataResponse[0] as Fixture)
                                            .matchStatus ==
                                        'Finished'
                                    ? true
                                    : false,
                              ),
                            ),
                          ),
                        // const SizedBox(height: AppSize.size5),
                        // _builBlocBase(
                        //   content: _buildBlockTable(
                        //     isResult: true,
                        //     colorBackground: AppColors.red_631,
                        //   ),
                        // ),
                        const SizedBox(height: AppSize.size10),
                        if (LocalStorageService().isExistKey('favTeam'))
                          InkWell(
                            onTap: () {
                              Get.toNamed(AppRoutes.ranking);
                            },
                            child: _builBlocBase(
                              label: 'tables'.tr,
                              content: Container(
                                color: AppColors.grey_f2f,
                                width: double.infinity,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: AppSize.size10,
                                  vertical: AppSize.size15,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        TextCustom(
                                          text: controller
                                              .dataStanding
                                              .dataResponse[0]
                                              .overallLeaguePosition,
                                          weight: FontFamily.medium,
                                          fontSize: AppSize.size13,
                                          color: AppColors.black,
                                        ),
                                        const SizedBox(width: AppSize.size10),
                                        SvgPicture.asset(
                                          'assets/svg/arrow_down.svg',
                                          height: AppSize.size20,
                                          color: AppColors.red,
                                        ),
                                        const SizedBox(width: AppSize.size5),
                                        SvgPicture.asset(
                                          Flag.allFlags[controller.dataStanding
                                                  .dataResponse[0].teamName] ??
                                              'assets/svg/flag/vn.svg',
                                          height: AppSize.size18,
                                        ),
                                        const SizedBox(width: AppSize.size10),
                                        TextCustom(
                                          text: controller.dataStanding
                                              .dataResponse[0].teamName,
                                          color: AppColors.black,
                                          fontSize: AppSize.size14,
                                          weight: FontFamily.medium,
                                        )
                                      ],
                                    ),
                                    TextCustom(
                                      text:
                                          '${controller.dataStanding.dataResponse[0].overallLeaguePTS} pts',
                                      color: AppColors.black,
                                      fontSize: AppSize.size14,
                                      weight: FontFamily.medium,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        const SizedBox(height: AppSize.size10),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSize.size10,
                          ),
                          child: Column(
                            children: [
                              for (var i = 0; i < labelButton.length; i++)
                                _buildButton(
                                  label: labelButton[i],
                                  onTap: listFunc[i],
                                ),
                            ],
                          ),
                        ),
                        const SizedBox(height: AppSize.size5),
                        Container(
                          height: 600,
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: AppSize.size10),
                                height: AppSize.size45,
                                child: TabBar(
                                  indicatorColor: AppColors.red,
                                  labelColor: AppColors.white,
                                  tabs: [
                                    Tab(
                                      text: 'SQUAD'.tr,
                                    ),
                                    Tab(
                                      text: 'GOALS'.tr,
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: AppSize.size10),
                              Expanded(
                                child: TabBarView(
                                  children: [
                                    Container(
                                      color: AppColors.white,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: AppSize.size10),
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            for (var players in controller
                                                .listPlayer.dataResponse)
                                              _buildBlocPlayers(players),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SingleChildScrollView(
                                      child: Container(
                                        color: AppColors.white,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: AppSize.size10),
                                        margin: const EdgeInsets.symmetric(
                                            horizontal: AppSize.size10),
                                        child: Column(
                                          children: [
                                            const SizedBox(
                                              height: AppSize.size10,
                                            ),
                                            HeaaderSquad(
                                              txtHeader: 'Goals',
                                              padding: AppSize.size10,
                                            ),
                                            const SizedBox(
                                                height: AppSize.size10),
                                            for (var i = 0;
                                                i <
                                                    controller.listPlayerNormal
                                                        .dataResponse.length;
                                                i++)
                                              ItemRowTeam(
                                                player: controller
                                                    .listPlayerNormal
                                                    .dataResponse[i],
                                                idx: i,
                                              ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),

                        // const SizedBox(height: AppSize.size15),
                        // Container(
                        //   padding: const EdgeInsets.symmetric(
                        //       horizontal: AppSize.size10),
                        //   child: Column(
                        //     children: [
                        //       for (var i = 0; i < 3; i++) _buildButton(),
                        //     ],
                        //   ),
                        // ),
                        // const SizedBox(height: AppSize.size15),
                        // Container(
                        //   padding: const EdgeInsets.symmetric(
                        //       horizontal: AppSize.size10),
                        //   child: Column(
                        //     children: [
                        //       for (var i = 0; i < 3; i++) _buildButton(
                        //         label:
                        //       ),
                        //     ],
                        //   ),
                        // ),

                        // const SizedBox(height: AppSize.size15),
                        // Container(
                        //   padding: const EdgeInsets.symmetric(
                        //       horizontal: AppSize.size10),
                        //   child: Column(
                        //     children: [
                        //       for (var i = 0; i < 4; i++) _buildButton(),
                        //     ],
                        //   ),
                        // ),
                        const SizedBox(height: AppSize.size30),
                      ],
                    ),
                  ),
                ),
        ),
      ),
    );
  }

  Widget _buildButton({required String label, Function()? onTap}) {
    return Column(
      children: [
        ButtonBase(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSize.size5),
          ),
          onPressed: onTap,
          fillColor: AppColors.white,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSize.size20,
              vertical: AppSize.size15,
            ),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextCustom(
                  text: label,
                  color: AppColors.black,
                  weight: FontFamily.medium,
                ),
                SvgPicture.asset(
                  'assets/svg/arrow_right.svg',
                  height: AppSize.size20,
                )
              ],
            ),
          ),
        ),
        SizedBox(height: AppSize.size5),
      ],
    );
  }

  Widget _builBlocBase({required Widget content, String label = 'Fixtures'}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.size10),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppSize.size5),
            ),
            clipBehavior: Clip.hardEdge,
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  color: AppColors.white,
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppSize.size15, vertical: AppSize.size15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextCustom(
                        text: label,
                        color: AppColors.black,
                        weight: FontFamily.medium,
                        fontSize: AppSize.size14,
                      ),
                      SvgPicture.asset(
                        'assets/svg/arrow_right.svg',
                        height: AppSize.size20,
                      )
                    ],
                  ),
                ),
                content,
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBlockTable(
      {bool isResult = false,
      Color colorBackground = AppColors.white,
      required Fixture fixture}) {
    return Container(
      width: double.infinity,
      color: AppColors.grey_f2f,
      padding: const EdgeInsets.symmetric(
        horizontal: AppSize.size10,
        vertical: AppSize.size15,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextCustom(
            text: fixture.matchDate,
            color: AppColors.black,
            fontSize: AppSize.size12,
          ),
          ItemHeadToHead(
            sizeFlag: AppSize.size18,
            sizeTextFlag: AppSize.size13,
            padding: const EdgeInsets.symmetric(
              horizontal: AppSize.size8,
              vertical: AppSize.size4,
            ),
            backgoundTime: colorBackground,
            isResult: isResult,
            fixture: fixture,
          ),
        ],
      ),
    );
  }

  Widget _buildBlocPlayers(List<pl.Player> players) {
    return Column(
      children: [
        HeaaderSquad(txtHeader: players[0].playerType),
        for (var player in players)
          ItemFirstteamPlayer(
            player: player,
          ),
        const SizedBox(height: AppSize.size20),
      ],
    );
  }
}
