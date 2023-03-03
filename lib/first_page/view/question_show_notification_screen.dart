import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_font.dart';
import 'package:worldcup_app/config_app/app_size.dart';
import 'package:worldcup_app/first_page/view/choose_notification_screen.dart';
import 'package:worldcup_app/home_page/view/home_screen.dart';

class QuestionShowNotificationScreen extends StatelessWidget {
  const QuestionShowNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: SafeArea(
        child: Column(
          children: [
            HeaderBase(text: 'OtherTeam'.tr),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: AppSize.size15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/svg/notification.svg',
                      height: AppSize.size_logo,
                      color: AppColors.white,
                    ),
                    const SizedBox(height: AppSize.size10),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: AppSize.size20),
                      child: TextCustom(
                        text: 'wouldyoulikewoorldcup',
                        align: TextAlign.center,
                        fontSize: AppSize.size16,
                        weight: FontFamily.medium,
                      ),
                    ),
                    const SizedBox(height: AppSize.size10),
                    const TextCustom(
                      text: 'keepuptodate',
                      align: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: AppSize.size15,
                vertical: AppSize.size10,
              ),
              child: Column(
                children: [
                  ButtonBase.common(
                    text: 'NoThanks'.tr,
                    onPressed: () {
                      Get.to(
                        () => HomeScreen(),
                        transition: Transition.rightToLeftWithFade,
                        duration: const Duration(milliseconds: 600),
                      );
                    },
                    fillColor: AppColors.white,
                    textColor: AppColors.black,
                  ),
                  const SizedBox(height: AppSize.size10),
                  ButtonBase.common(
                    text: 'yeschoosenotification'.tr,
                    onPressed: () {
                      Get.to(
                        () => ChooseNotificationScreen(),
                        transition: Transition.rightToLeftWithFade,
                        duration: const Duration(milliseconds: 600),
                      );
                    },
                    fillColor: AppColors.red_99,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
