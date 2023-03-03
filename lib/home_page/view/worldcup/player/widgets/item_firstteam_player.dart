import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/config_app/app_api.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_font.dart';
import 'package:worldcup_app/config_app/app_routes.dart';
import 'package:worldcup_app/config_app/app_size.dart';
import 'package:worldcup_app/home_page/view/worldcup/player/details_player_screen.dart';
import 'package:worldcup_app/models/flag.dart';
import 'package:worldcup_app/models/player/player.dart';
import 'package:worldcup_app/services/storage/local_storage_service.dart';

class ItemFirstteamPlayer extends StatelessWidget {
  final Player? player;
  const ItemFirstteamPlayer({super.key, this.player});

  @override
  Widget build(BuildContext context) {
    var args = Get.arguments;
    return InkWell(
      onTap: () {
        Get.toNamed(
          AppRoutes.detailsPlayer,
          arguments: {
            AppApi.playerId: player?.playerKey ?? '',
            AppApi.teamName: args[AppApi.teamName],
            AppApi.playerName: player?.playerName ?? '',
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: AppSize.size10),
        height: AppSize.size60,
        width: AppSize.sizeWidthApp,
        child: Column(
          children: [
            Row(children: [
              Container(
                width: AppSize.size60,
                height: AppSize.size60 - 1,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(player!.playerImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                height: AppSize.size60 - 1,
                width: 300,
                padding: const EdgeInsets.symmetric(horizontal: AppSize.size10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        TextCustom(
                            text: player!.playerName,
                            color: AppColors.black,
                            weight: FontFamily.medium),
                        SizedBox(
                          width: AppSize.size10,
                        ),
                        TextCustom(
                            text: player!.playerType, color: AppColors.black)
                      ],
                    ),
                    const SizedBox(height: AppSize.size5),
                    Row(
                      children: [
                        SvgPicture.asset(
                          Flag.allFlags[args?[AppApi.teamName]] ??
                              Flag.allFlags[LocalStorageService()
                                      .getString('favTeamName') ??
                                  ''] ??
                              'assets/svg/flag/vn.svg',
                          height: AppSize.size20,
                        ),
                        const SizedBox(
                          width: AppSize.size15,
                        ),
                        TextCustom(
                          text: args?[AppApi.teamName] ?? '',
                          color: AppColors.black,
                        ),
                      ],
                    )
                  ],
                ),
              )
            ]),
            Container(
                height: AppSize.size1,
                width: AppSize.sizeWidthApp,
                color: AppColors.grey.withOpacity(0.3))
          ],
        ),
      ),
    );
  }
}
