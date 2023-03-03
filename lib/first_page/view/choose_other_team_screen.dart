import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/common/widgets/loading_base.dart';
import 'package:worldcup_app/config_app/config_app.dart';
import 'package:worldcup_app/first_page/controllers/choose_fav_team_controller.dart';
import 'package:worldcup_app/first_page/view/question_receive_mail_screen.dart';
import 'package:worldcup_app/models/flag.dart';

class ChooseOtherTeamScreen extends GetView<ChooseFavTeamController> {
  const ChooseOtherTeamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: SafeArea(
        child: Column(
          children: [
            HeaderBase(text: 'OtherTeam'.tr),
            Align(
              alignment: Alignment.center,
              child: TextCustom(
                text: 'SelectTheTeam'.tr,
                fontSize: AppSize.size14,
                weight: FontFamily.medium,
              ),
            ),
            const SizedBox(height: AppSize.size10),
            Expanded(
              child: Obx(
                () => controller.isLoading.value
                    ? const LoadingBase()
                    : Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: AppSize.size40,
                          vertical: AppSize.size40,
                        ),
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius:
                                BorderRadius.circular(AppSize.size10)),
                        child: controller.dataRepo.error.isNotEmpty
                            ? const Center(
                                child: TextCustom(
                                  text: 'Lỗi không lấy được danh sách đội bóng',
                                ),
                              )
                            : ListView.separated(
                                physics: const BouncingScrollPhysics(),
                                itemCount: controller.listTeam.length,
                                separatorBuilder: (context, index) =>
                                    AnimationConfiguration.staggeredList(
                                  position: index,
                                  duration: const Duration(milliseconds: 300),
                                  child: SlideAnimation(
                                    verticalOffset: 100,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: AppSize.size5),
                                      child: const Divider(
                                        height: 0,
                                      ),
                                    ),
                                  ),
                                ),
                                itemBuilder: (BuildContext context, int index) {
                                  return AnimationConfiguration.staggeredList(
                                    position: index,
                                    duration: const Duration(milliseconds: 300),
                                    child: SlideAnimation(
                                      verticalOffset: 100,
                                      child: InkWell(
                                        onTap: () =>
                                            controller.chooseOtherTeams(index),
                                        child: Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: AppSize.size10,
                                            vertical: AppSize.size15,
                                          ),
                                          color: AppColors.white,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  SvgPicture.asset(
                                                    Flag.allFlags[controller
                                                        .listTeam[index]
                                                        .teamName]!,
                                                    width: AppSize.size30,
                                                  ),
                                                  const SizedBox(
                                                      width: AppSize.size5),
                                                  TextCustom(
                                                    text: controller
                                                        .listTeam[index]
                                                        .teamName,
                                                    color: AppColors.black,
                                                    fontSize: AppSize.size14,
                                                  ),
                                                ],
                                              ),
                                              SvgPicture.asset(
                                                controller
                                                        .listTeam[index].isCheck
                                                    ? 'assets/svg/check.svg'
                                                    : 'assets/svg/add.svg',
                                                width: AppSize.size25,
                                                color: controller
                                                        .listTeam[index].isCheck
                                                    ? AppColors.green
                                                    : AppColors.grey,
                                              ),
                                              // SvgPicture.asset(
                                              //   'assets/svg/check.svg',
                                              //   color: AppColors.green,
                                              // ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                      ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: AppSize.size25),
              child: ButtonBase.common(
                text: 'Continue'.tr,
                fontSize: AppSize.size16,
                fontWeight: FontFamily.medium,
                iconColor: AppColors.transparent,
                onPressed: controller.setOtherTeam,
                fillColor: AppColors.red_E01,
              ),
            ),
            const SizedBox(height: AppSize.size20),
          ],
        ),
      ),
    );
  }
}
