import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/common/widgets/loading_base.dart';
import 'package:worldcup_app/config_app/app_api.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_font.dart';
import 'package:worldcup_app/config_app/app_size.dart';
import 'package:worldcup_app/home_page/view/worldcup/player/overview_player.dart';
import 'package:worldcup_app/home_page/view/worldcup/player/widgets/item_man.dart';
import 'package:worldcup_app/player/controller/players_controller.dart';

class DetailsPlayersScreen extends GetView<PlayersController> {
  const DetailsPlayersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: SafeArea(
          child: Column(
        children: [
          HeaderBase(
            text: Get.arguments[AppApi.playerName],
            onTap: () => Get.back(),
          ),
          Expanded(
            child: Obx(
              () => controller.isLoading
                  ? const LoadingBase()
                  : (controller.loadingPlayers.error.isNotEmpty
                      ? Center(
                          child: TextCustom(
                            text: controller.loadingPlayers.error,
                            color: AppColors.white,
                          ),
                        )
                      : Column(
                          children: const [
                            ItemMan(),
                            Expanded(
                              child: OverviewPlayer(),
                            ),
                          ],
                        )),
            ),
          )
        ],
      )),
    );
  }
}
