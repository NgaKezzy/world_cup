import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/common/widgets/base_screen.dart';
import 'package:worldcup_app/common/widgets/loading_base.dart';
import 'package:worldcup_app/config_app/app_api.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_font.dart';
import 'package:worldcup_app/config_app/app_size.dart';
import 'package:worldcup_app/config_app/config_app.dart';
import 'package:worldcup_app/home_page/controllers/stats_controller.dart';
import 'package:worldcup_app/home_page/view/stats/widgets/player_stats.dart';
import 'package:worldcup_app/home_page/view/stats/widgets/season_stats.dart';

class StatsScreen extends GetView<StatsController> {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      withScaffold: false,
      child: Obx(
        () => controller.isLoading
            ? const LoadingBase()
            : SafeArea(
                child: controller.listTopScores.error.isNotEmpty
                    ? Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppSize.size20),
                        child: Center(
                          child: TextCustom(
                            text: 'Thetournamenthasnot'.tr,
                            color: AppColors.white,
                            fontSize: AppSize.size14,
                            weight: FontFamily.medium,
                            align: TextAlign.center,
                          ),
                        ),
                      )
                    : SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Container(
                          padding: const EdgeInsets.all(AppSize.size10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: AppSize.size30),
                              Row(
                                children: const [
                                  TextCustom(
                                    text: "TopScore",
                                    fontSize: AppSize.size26,
                                    weight: FontFamily.medium,
                                  ),
                                ],
                              ),
                              const SizedBox(height: AppSize.size12),
                              const TextCustom(
                                text: "2022 Top Score",
                                weight: FontFamily.medium,
                                fontSize: AppSize.size14,
                              ),
                              const SizedBox(height: AppSize.size15),
                              SizedBox(
                                child: GridView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 10 / 7,
                                    mainAxisSpacing: AppSize.size10,
                                    crossAxisSpacing: AppSize.size10,
                                  ),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: controller
                                      .listTopScores.dataResponse!.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return InkWell(
                                      onTap: () {
                                        Get.toNamed(
                                          AppRoutes.detailsPlayer,
                                          arguments: {
                                            AppApi.playerId: controller
                                                    .listTopScores
                                                    .dataResponse?[index]
                                                    .playerKey ??
                                                '',
                                            AppApi.teamName: controller
                                                .listTopScores
                                                .dataResponse?[index]
                                                .teamName,
                                            AppApi.playerName: controller
                                                    .listTopScores
                                                    .dataResponse?[index]
                                                    .playerName ??
                                                '',
                                          },
                                        );
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              AppSize.size5),
                                          color: AppColors.red_631,
                                        ),
                                        padding:
                                            const EdgeInsets.all(AppSize.size4),
                                        child: Column(
                                          children: [
                                            Container(
                                              padding: const EdgeInsets.all(
                                                AppSize.size10,
                                              ),
                                              child: Row(
                                                children: [
                                                  TextCustom(
                                                    text:
                                                        '${index + 1}. ${controller.listTopScores.dataResponse![index].playerName}',
                                                    fontSize: AppSize.size16,
                                                    weight: FontFamily.medium,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Spacer(),
                                            Container(
                                              width: AppSize.sizeWidthApp,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        AppSize.size5),
                                                color: Colors.purple[800],
                                              ),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                vertical: AppSize.size5,
                                              ),
                                              child: Column(
                                                children: [
                                                  TextCustom(
                                                    text: controller
                                                            .listTopScores
                                                            .dataResponse?[
                                                                index]
                                                            .goals ??
                                                        '0',
                                                    color: AppColors.pink,
                                                    fontSize: AppSize.size24,
                                                    weight: FontFamily.semiBold,
                                                  ),
                                                  TextCustom(
                                                    text: "Goals".tr,
                                                    color: Colors.white,
                                                    fontSize: AppSize.size14,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
              ),
      ),
    );
  }
}
