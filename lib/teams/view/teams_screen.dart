import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/common/widgets/loading_base.dart';
import 'package:worldcup_app/config_app/app_api.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_font.dart';
import 'package:worldcup_app/config_app/app_size.dart';
import 'package:worldcup_app/config_app/config_app.dart';
import 'package:worldcup_app/home_page/view/worldcup/details_team_screen.dart';
import 'package:worldcup_app/models/flag.dart';
import 'package:worldcup_app/teams/controllers/teams_controller.dart';

class TeamsScreen extends GetView<TeamsController> {
  const TeamsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: SafeArea(
        child: Column(
          children: [
            HeaderBase(
              text: 'Team'.tr,
              onTap: () => Get.back(),
            ),
            Expanded(
              child: Container(
                color: AppColors.white,
                child: Obx(
                  () => controller.isLoading
                      ? const LoadingBase(
                          color: AppColors.red_99,
                        )
                      : (controller.listTeam.error.isNotEmpty
                          ? TextCustom(
                              text: controller.listTeam.error,
                              color: AppColors.black,
                            )
                          : ListView.separated(
                              physics: const BouncingScrollPhysics(),
                              separatorBuilder: (context, index) =>
                                  const Divider(
                                height: AppSize.size0,
                                color: AppColors.grey_f2f,
                              ),
                              itemBuilder: (context, index) => InkWell(
                                onTap: () => Get.toNamed(AppRoutes.detailsTeam,
                                    arguments: {
                                      AppApi.teamId: controller.listTeam
                                          .dataResponse![index].teamKey,
                                      AppApi.teamName: controller.listTeam
                                          .dataResponse![index].teamName,
                                    }),
                                child: Container(
                                  width: AppSize.sizeWidthApp,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: AppSize.size15,
                                    vertical: AppSize.size15,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset(
                                            Flag.allFlags[controller
                                                    .listTeam
                                                    .dataResponse![index]
                                                    .teamName] ??
                                                'assets/svg/flag/vn.svg',
                                            height: AppSize.size25,
                                          ),
                                          const SizedBox(width: AppSize.size10),
                                          TextCustom(
                                            text: controller.listTeam
                                                .dataResponse![index].teamName,
                                            color: AppColors.black,
                                            weight: FontFamily.semiBold,
                                            fontSize: AppSize.size14,
                                          )
                                        ],
                                      ),
                                      SvgPicture.asset(
                                        'assets/svg/arrow_right.svg',
                                        height: AppSize.size20,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              itemCount: 32,
                            )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
