import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/common/widgets/loading_base.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_size.dart';
import 'package:worldcup_app/home_page/view/worldcup/player/first_team.dart';
import 'package:worldcup_app/home_page/view/worldcup/player/pl2.dart';
import 'package:worldcup_app/home_page/view/worldcup/player/u18.dart';
import 'package:worldcup_app/player/controller/players_controller.dart';

class Player extends GetView<PlayersController> {
  const Player({super.key});

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
                    text: 'Player',
                    onTap: () => Get.back(),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: AppSize.sizeHeightApp - 95,
                        child: DefaultTabController(
                          length: 3,
                          child: Column(
                            children: const [
                              TabBar(indicatorColor: AppColors.red, tabs: [
                                Tab(
                                  text: 'First Team',
                                ),
                                Tab(
                                  text: 'PL2',
                                ),
                                Tab(
                                  text: 'U18',
                                ),
                              ]),
                              Expanded(
                                child: TabBarView(
                                  children: [
                                    FirstTeam(),
                                    FirstTeam(),
                                    FirstTeam(),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )),
      ),
    );
  }
}
