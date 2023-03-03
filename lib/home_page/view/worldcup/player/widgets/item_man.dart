import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_font.dart';
import 'package:worldcup_app/config_app/app_size.dart';
import 'package:worldcup_app/models/flag.dart';
import 'package:worldcup_app/player/controller/players_controller.dart';

class ItemMan extends GetView<PlayersController> {
  const ItemMan({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppSize.size100 * 1.8,
      width: AppSize.sizeWidthApp,
      // color: AppColors.green,
      padding: const EdgeInsets.symmetric(horizontal: AppSize.size10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Image.network(
            controller.loadingPlayers.dataResponse.playerImage,
            height: AppSize.size100 * 1.6,
            width: AppSize.size100 * 1.6,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: AppSize.size20),
          SizedBox(
            height: AppSize.size100 * 1.5,
            width: AppSize.sizeWidthApp * 0.45,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextCustom(
                    text: controller.loadingPlayers.dataResponse.playerName,
                    fontSize: AppSize.size18,
                    weight: FontFamily.medium,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        Flag.allFlags[controller
                                .loadingPlayers.dataResponse.teamName] ??
                            'assets/svg/flag/vn.svg',
                        height: AppSize.size20,
                      ),
                      const SizedBox(width: AppSize.size10),
                      TextCustom(
                        text: controller.loadingPlayers.dataResponse.teamName,
                        fontSize: AppSize.size16,
                        weight: FontFamily.medium,
                      ),
                    ],
                  ),
                  TextCustom(
                    text: controller.loadingPlayers.dataResponse.playerAge +
                        ' years old',
                    fontSize: AppSize.size16,
                    weight: FontFamily.medium,
                  ),
                  TextCustom(
                    text: controller.loadingPlayers.dataResponse.playerType,
                    fontSize: AppSize.size16,
                    weight: FontFamily.medium,
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
