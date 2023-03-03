import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/common/widgets/loading_base.dart';
import 'package:worldcup_app/config_app/config_app.dart';
import 'package:worldcup_app/first_page/controllers/choose_fav_team_controller.dart';
import 'package:worldcup_app/first_page/view/question_add_more_team_screen.dart';
import 'package:worldcup_app/models/flag.dart';

class ChooseFavouriteTeamScreen extends GetView<ChooseFavTeamController> {
  const ChooseFavouriteTeamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: SafeArea(
        child: Column(
          children: [
            HeaderBase(
              text: 'Favouriteteam'.tr,
              onTap: () => Get.back(),
            ),
            const SizedBox(height: AppSize.size30),
            Align(
              alignment: Alignment.center,
              child: TextCustom(
                text: 'Whoisyour'.tr,
                fontSize: AppSize.size14,
              ),
            ),
            Expanded(
              child: Obx(
                () => controller.isLoading.value
                    ? const LoadingBase()
                    : Container(
                        alignment: Alignment.center,
                        margin: const EdgeInsets.symmetric(
                          horizontal: AppSize.size30,
                          vertical: AppSize.size10,
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSize.size20,
                          vertical: AppSize.size30,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppSize.size5),
                          color: AppColors.white,
                        ),
                        clipBehavior: Clip.hardEdge,
                        child: controller.dataRepo.error.isNotEmpty
                            ? const Center(
                                child: TextCustom(
                                  text:
                                      'Xảy ra lỗi trong quá trình tải danh sách các đội',
                                ),
                              )
                            : SingleChildScrollView(
                                child: Column(
                                  children: [
                                    for (var i = 0;
                                        i < controller.listTeam.length;
                                        i++)
                                      InkWell(
                                        onTap: () => controller.chooseTeams(i),
                                        child: Container(
                                          width: double.infinity,
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      SizedBox(
                                                        width: AppSize.size35,
                                                        height: AppSize.size35,
                                                        child: ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      AppSize
                                                                          .size5),
                                                          child:
                                                              SvgPicture.asset(
                                                            Flag.allFlags[controller
                                                                    .listTeam[i]
                                                                    .teamName] ??
                                                                'assets/svg/flag/vn.svg',
                                                            fit: BoxFit.cover,
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                          width:
                                                              AppSize.size15),
                                                      TextCustom(
                                                        text: controller
                                                            .listTeam[i]
                                                            .teamName,
                                                        color: AppColors.black,
                                                        weight:
                                                            FontFamily.medium,
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    width: AppSize.size45,
                                                    height: AppSize.size45,
                                                    child: Align(
                                                      alignment:
                                                          Alignment.center,
                                                      child: SvgPicture.asset(
                                                        controller.listTeam[i]
                                                                .isCheck
                                                            ? 'assets/svg/check.svg'
                                                            : 'assets/svg/add.svg',
                                                        height: AppSize.size30,
                                                        color: controller
                                                                .listTeam[i]
                                                                .isCheck
                                                            ? AppColors.green
                                                            : AppColors.grey,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: AppSize.size20,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                      ),
              ),
            ),
            const SizedBox(height: AppSize.size15),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: AppSize.size10,
                vertical: AppSize.size5,
              ),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: AppSize.size25),
                child: ButtonBase.common(
                  text: 'Continue'.tr,
                  fontSize: AppSize.size16,
                  fontWeight: FontFamily.medium,
                  onPressed: controller.setFavTeam,
                  iconColor: AppColors.transparent,
                  fillColor: AppColors.red_E01,
                ),
              ),
            ),
            const SizedBox(height: AppSize.size30),
          ],
        ),
      ),
    );
  }
}
