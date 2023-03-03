import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/config_app/config_app.dart';
import 'package:worldcup_app/home_page/view/home_screen.dart';
import 'package:worldcup_app/services/storage/local_storage_service.dart';

class ChooseNotificationScreen extends StatelessWidget {
  const ChooseNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      child: SafeArea(
        child: Column(
          children: [
            HeaderBase(text: 'NotificationPreferences'.tr),
            Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: AppSize.size50),
                child: TextCustomNotAutoScale(
                  text: 'Whatwouldyoulikeabout'.tr,
                  fontSize: AppSize.size14,
                  weight: FontFamily.medium,
                  align: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: AppSize.size20),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: AppSize.size15,
                ),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      _buildContainer(2),
                      const SizedBox(height: AppSize.size30),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: TextCustom(
                          text: 'Other Premier League Teams',
                          fontSize: AppSize.size14,
                          weight: FontFamily.medium,
                        ),
                      ),
                      const SizedBox(height: AppSize.size5),
                      _buildContainer(32),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: AppSize.size10,
                vertical: AppSize.size5,
              ),
              child: ButtonBase.common(
                text: 'Continue'.tr,
                onPressed: () {
                  LocalStorageService().setString('isFirstUsing', 'done');
                  Get.toNamed(AppRoutes.home);
                },
                fillColor: AppColors.red_99,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContainer(int length) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppSize.size10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppSize.size5),
      ),
      child: Column(
        children: [
          const SizedBox(height: AppSize.size10),
          _buildItemNotification(value: true),
          Divider(
            height: AppSize.size0,
            color: AppColors.grey.withOpacity(0.4),
            thickness: AppSize.size2,
          ),
          const SizedBox(height: AppSize.size5),
          for (var i = 0; i < length; i++) _buildItemNotification(),
        ],
      ),
    );
  }

  Widget _buildItemNotification(
      {String pathIcon = 'assets/svg/flag/vn.svg',
      String text = 'Germany',
      bool value = false}) {
    return SizedBox(
      child: Column(
        children: [
          Row(
            children: [
              SvgPicture.asset(
                pathIcon,
                width: AppSize.size40,
              ),
              const SizedBox(width: AppSize.size15),
              TextCustom(
                text: text,
                color: AppColors.black,
                weight: FontFamily.medium,
              ),
              const Spacer(),
              Switch(
                value: value,
                onChanged: (value) {},
                activeTrackColor: AppColors.green_C0E,
                activeColor: AppColors.green_2EC,
              ),
            ],
          ),
          const SizedBox(height: AppSize.size10),
        ],
      ),
    );
  }
}
