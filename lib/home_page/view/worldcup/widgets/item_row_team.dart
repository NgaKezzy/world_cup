import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/config_app/app_api.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_font.dart';
import 'package:worldcup_app/config_app/app_size.dart';
import 'package:worldcup_app/models/flag.dart';
import 'package:worldcup_app/models/player/player.dart';
import 'package:worldcup_app/services/storage/local_storage_service.dart';

class ItemRowTeam extends StatelessWidget {
  final Player player;
  final int idx;
  const ItemRowTeam({super.key, required this.player, required this.idx});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: AppSize.sizeWidthApp,
      child: Column(
        children: [
          Container(
            height: AppSize.size70,
            width: AppSize.sizeWidthApp,
            // color: AppColors.green,
            child: Column(
              children: [
                Row(children: [
                  Container(
                    height: AppSize.size70 - 1,
                    alignment: Alignment.center,
                    width: AppSize.sizeWidthApp * 0.08,
                    child: TextCustom(
                        text: '${idx + 1}.',
                        color: AppColors.black,
                        fontSize: AppSize.size16,
                        weight: FontFamily.medium),
                  ),
                  Expanded(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                        TextCustom(
                            text: player.playerName,
                            fontSize: AppSize.size16,
                            color: AppColors.black,
                            weight: FontFamily.semiBold),
                        TextCustom(
                          text: Get.arguments?[AppApi.teamName] ??
                              LocalStorageService().getString('favTeamName'),
                          fontSize: AppSize.size16,
                          color: AppColors.black,
                        ),
                      ])),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        Flag.allFlags[Get.arguments?[AppApi.teamName]] ??
                            Flag.allFlags[LocalStorageService()
                                .getString('favTeamName')] ??
                            'assets/svg/flag/vn.svg',
                        height: AppSize.size20,
                      )
                    ],
                  ),
                  const SizedBox(width: AppSize.size20),
                  SizedBox(
                    width: AppSize.sizeWidthApp * 0.05,
                    child: TextCustom(
                        text: player.playerGoals,
                        fontSize: AppSize.size16,
                        color: AppColors.pink,
                        weight: FontFamily.semiBold),
                  )
                ]),
                Container(
                    height: AppSize.size1,
                    width: AppSize.sizeWidthApp,
                    color: AppColors.grey.withOpacity(0.4))
              ],
            ),
          )
        ],
      ),
    );
  }
}
