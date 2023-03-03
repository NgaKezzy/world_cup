import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/common/widgets/loading_base.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_font.dart';
import 'package:worldcup_app/config_app/app_size.dart';
import 'package:worldcup_app/store/controllers/store_sale_controller.dart';

class StoreSaleSceen extends GetView<StoreSaleController> {
  const StoreSaleSceen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      backgroundPath: 'assets/images/bg_purple.png',
      child: SafeArea(
        child: Obx(
          () => controller.isLoading.value
              ? const LoadingBase()
              : Stack(
                  children: [
                    Column(
                      children: [
                        SizedBox(height: AppSize.size30),
                        Row(
                          children: [
                            Spacer(),
                            InkWell(
                              onTap: () => Get.back(),
                              child: SvgPicture.asset(
                                'assets/svg/close.svg',
                                height: AppSize.size40,
                                color: AppColors.white,
                              ),
                            ),
                            SizedBox(width: AppSize.size20),
                          ],
                        ),
                        Spacer(),
                      ],
                    ),
                    Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSize.size20,
                        ),
                        child: CachedNetworkImage(
                          imageUrl: controller.pathImage,
                          height: AppSize.sizeWidthApp <= 375
                              ? 450
                              : (AppSize.sizeWidthApp <= 414 ? 500 : null),
                        ),
                      ),
                    ),
                    if (controller.enableShop)
                      Column(
                        children: [
                          Spacer(),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppSize.size30,
                              vertical: AppSize.size50,
                            ),
                            child: Center(
                              child: ButtonBase(
                                onPressed: () {
                                  launchUrlString(
                                    'https://rebrand.ly/pushads',
                                    mode: Platform.isAndroid
                                        ? LaunchMode
                                            .externalNonBrowserApplication
                                        : LaunchMode.platformDefault,
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: AppSize.size10,
                                    horizontal: AppSize.size25,
                                  ),
                                  child: TextCustom(
                                    text: 'SHOP NOW',
                                    fontSize: AppSize.size20,
                                    weight: FontFamily.medium,
                                  ),
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(AppSize.size15),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                  ],
                ),
        ),
      ),
    );
  }
}
