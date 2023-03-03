import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_size.dart';
import 'package:worldcup_app/home_page/view/worldcup/player/widgets/item_firstteam_player.dart';

class U18 extends StatelessWidget {
  const U18({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.sizeHeightApp,
      width: AppSize.sizeWidthApp,
      color: AppColors.white,
      child: SingleChildScrollView(
          child: Column(
        children: const [
          ItemFirstteamPlayer(),
          ItemFirstteamPlayer(),
          ItemFirstteamPlayer(),
          ItemFirstteamPlayer(),
          ItemFirstteamPlayer(),
          ItemFirstteamPlayer(),
          ItemFirstteamPlayer(),
          ItemFirstteamPlayer(),
          ItemFirstteamPlayer(),
          ItemFirstteamPlayer(),
          ItemFirstteamPlayer(),
          ItemFirstteamPlayer(),
          ItemFirstteamPlayer(),
          ItemFirstteamPlayer(),
          ItemFirstteamPlayer(),
          ItemFirstteamPlayer(),
        ],
      )),
    );
  }
}
