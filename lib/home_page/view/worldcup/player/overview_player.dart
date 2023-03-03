import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/config_app/config_app.dart';
import 'package:worldcup_app/home_page/view/worldcup/player/widgets/personal_detail.dart';
import 'package:worldcup_app/player/controller/players_controller.dart';

class OverviewPlayer extends GetView<PlayersController> {
  const OverviewPlayer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: AppSize.size15,
          ),
          Container(
            width: AppSize.sizeWidthApp,
            color: AppColors.white,
            padding: const EdgeInsets.only(
                left: AppSize.size10, right: AppSize.size10),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(
                height: AppSize.size10,
              ),
              TextCustom(
                text: 'personaldetail'.tr,
                fontSize: AppSize.size16,
                color: AppColors.black,
                weight: FontFamily.medium,
              ),
              const SizedBox(
                height: AppSize.size10,
              ),
              PersonalDetail(
                  title: 'countryOfBirth'.tr,
                  description: controller.loadingPlayers.dataResponse.teamName),
              PersonalDetail(
                title: 'Nationalteam'.tr,
                description: controller.loadingPlayers.dataResponse.teamName,
              ),
              PersonalDetail(
                title: 'Age'.tr,
                description: controller.loadingPlayers.dataResponse.playerAge,
              ),
              PersonalDetail(
                title: 'DateOfBirth'.tr,
                description:
                    controller.loadingPlayers.dataResponse.playerBirthdate,
              ),
              PersonalDetail(
                title: 'Goals'.tr,
                description: controller.loadingPlayers.dataResponse.playerGoals,
              ),
            ]),
          ),
          const SizedBox(
            height: AppSize.size20,
          ),
        ],
      ),
    );
  }
}
