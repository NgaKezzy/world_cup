import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/common/widgets/loading_base.dart';
import 'package:worldcup_app/config_app/app_api.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_size.dart';
import 'package:worldcup_app/details_team/controllers/details_team_controller.dart';
import 'package:worldcup_app/home_page/view/worldcup/tab_team.dart';
import 'package:worldcup_app/home_page/view/worldcup/widgets/item_news.dart';
import 'package:worldcup_app/home_page/view/worldcup/widgets/item_squad.dart';
import 'package:worldcup_app/home_page/view/worldcup/widgets/item_start.dart';

class DetailsTeamScreen extends GetView<DetailsTeamController> {
  const DetailsTeamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: Obx(
        () => controller.isLoading
            ? const LoadingBase()
            : SafeArea(
                child: Column(
                  children: [
                    HeaderBase(
                      text: controller.args[AppApi.teamName],
                      onTap: () => Get.back(),
                    ),
                    Expanded(
                      child: controller.listPlayer.error.isNotEmpty
                          ? Center(
                              child: TextCustom(
                                text: controller.listPlayer.error,
                                color: AppColors.black,
                              ),
                            )
                          : CustomScrollView(
                              slivers: [
                                SliverAppBar(
                                  expandedHeight: 200.0,
                                  leading: const SizedBox(),
                                  flexibleSpace: Image.asset(
                                    'assets/images/s2.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SliverFillRemaining(
                                  child: SizedBox(
                                    height: AppSize.sizeHeightApp,
                                    width: AppSize.sizeWidthApp,
                                    child: DefaultTabController(
                                      length: 3,
                                      child: Column(
                                        children: [
                                          TabBar(
                                            indicatorColor: AppColors.red,
                                            labelColor: AppColors.white,
                                            tabs: [
                                              Tab(
                                                text: 'NEWS'.tr,
                                              ),
                                              Tab(
                                                text: 'SQUAD'.tr,
                                              ),
                                              Tab(
                                                text: 'GOALS'.tr,
                                              ),
                                            ],
                                          ),
                                          Expanded(
                                            child: TabBarView(
                                              children: [
                                                ItemNews(),
                                                ItemSquad(),
                                                TabTeam(),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
