import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:worldcup_app/common/common.dart';

import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_font.dart';
import 'package:worldcup_app/config_app/app_size.dart';
import 'package:worldcup_app/details_team/controllers/details_team_controller.dart';
import 'package:worldcup_app/home_page/view/worldcup/player/widgets/item_firstteam_player.dart';
import 'package:worldcup_app/home_page/view/worldcup/widgets/header_squad.dart';
import 'package:worldcup_app/home_page/view/worldcup/widgets/item_newcastle.dart';
import 'package:worldcup_app/models/player/player.dart';

class ItemSquad extends GetView<DetailsTeamController> {
  const ItemSquad({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: AppColors.white,
        child: Column(
          children: [
            for (var players in controller.listPlayer.dataResponse)
              _buildBlocPlayers(players),
          ],
        ),
      ),
    );
  }

  Widget _buildBlocPlayers(List<Player> players) {
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
