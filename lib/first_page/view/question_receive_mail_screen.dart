import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_font.dart';
import 'package:worldcup_app/config_app/app_routes.dart';
import 'package:worldcup_app/config_app/app_size.dart';
import 'package:worldcup_app/first_page/view/details_screen.dart';
import 'package:worldcup_app/first_page/view/question_show_notification_screen.dart';
import 'package:worldcup_app/services/storage/local_storage_service.dart';

class QuestionReceiveMailScreen extends StatelessWidget {
  const QuestionReceiveMailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: SafeArea(
        child: Column(
          children: [
            HeaderBase(
              text: 'OtherTeam'.tr,
              onTap: () => Get.back(),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: AppSize.size15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/svg/mail.svg',
                      height: AppSize.size90,
                      color: AppColors.white,
                    ),
                    const SizedBox(height: AppSize.size10),
                    TextCustom(
                      text: 'Wouldyouliketoreceiveemails'.tr,
                      align: TextAlign.center,
                      fontSize: AppSize.size14,
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
                      Get.offAllNamed(AppRoutes.home);
                    },
                    fillColor: AppColors.white,
                    textColor: AppColors.black,
                  ),
                  const SizedBox(height: AppSize.size10),
                  ButtonBase.common(
                    text: 'YesChooseEmails'.tr,
                    onPressed: () {
                      Get.toNamed(AppRoutes.inputInfo);
                    },
                    fillColor: AppColors.red,
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
