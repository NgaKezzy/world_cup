import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_font.dart';
import 'package:worldcup_app/config_app/app_routes.dart';
import 'package:worldcup_app/config_app/app_size.dart';
import 'package:worldcup_app/first_page/view/choose_other_team_screen.dart';
import 'package:worldcup_app/first_page/view/question_receive_mail_screen.dart';

class QuestionAddMoreTeam extends StatelessWidget {
  const QuestionAddMoreTeam({super.key});

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
                      'assets/svg/shield.svg',
                      height: AppSize.size_logo,
                      color: AppColors.white,
                    ),
                    const SizedBox(height: AppSize.size10),
                    TextCustom(
                      text: 'Wouldyouliketo'.tr,
                      align: TextAlign.center,
                      fontSize: AppSize.size16,
                      weight: FontFamily.medium,
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
                        () => const QuestionReceiveMailScreen(),
                        transition: Transition.rightToLeftWithFade,
                        duration: const Duration(milliseconds: 600),
                      );
                    },
                    fillColor: AppColors.white,
                    textColor: AppColors.black,
                  ),
                  const SizedBox(height: AppSize.size10),
                  ButtonBase.common(
                    text: 'YesPickTeams'.tr,
                    onPressed: () {
                      Get.toNamed(AppRoutes.chooseOtherTeam);
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
