import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_font.dart';
import 'package:worldcup_app/config_app/app_size.dart';
import 'package:worldcup_app/home_page/view/worldcup/player/widgets/item_firstteam_player.dart';
import 'package:worldcup_app/models/player/player.dart';
import 'package:worldcup_app/player/controller/players_controller.dart';

class FirstTeam extends GetView<PlayersController> {
  const FirstTeam({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.sizeHeightApp,
      width: AppSize.sizeWidthApp,
      color: AppColors.white,
      child: SingleChildScrollView(
          child: Column(
        children: [
          for (Player player in controller.loadingPlayers.dataResponse)
            ItemFirstteamPlayer(player: player),
        ],
      )),
    );
  }
}
