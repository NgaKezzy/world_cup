import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/common/widgets/item_new_video.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_font.dart';
import 'package:worldcup_app/config_app/app_size.dart';
import 'package:worldcup_app/detail_match/controllers/details_match_controller.dart';
import 'package:worldcup_app/home_page/view/worldcup/widgets/item_related_news.dart';
import 'package:worldcup_app/home_page/view/worldcup/widgets/item_related_videos.dart';

class Related extends GetView<DetailsMatchController> {
  const Related({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      children: [
        const SizedBox(height: AppSize.size15),
        const GradientLine(margin: AppSize.size10),
        Container(
          color: AppColors.white,
          padding: const EdgeInsets.symmetric(vertical: AppSize.size10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: AppSize.size10,
                  ),
                  TextCustom(
                    text: 'RelatedNews'.tr,
                    color: AppColors.black,
                    fontSize: AppSize.size16,
                    weight: FontFamily.medium,
                  ),
                ],
              ),
              const SizedBox(
                height: AppSize.size10,
              ),
              Container(
                height: AppSize.size2,
                width: AppSize.sizeWidthApp,
                color: AppColors.grey.withOpacity(0.3),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSize.size20,
                  vertical: AppSize.size10,
                ),
                child: controller.listNews.isEmpty
                    ? Center(
                        child: TextCustom(
                          text: 'Nomatchinfoyet'.tr,
                          color: AppColors.black,
                        ),
                      )
                    : Column(
                        children: const [
                          ItemNewsVideo(
                            textColor: AppColors.black,
                            isClub: true,
                            isVideo: false,
                            textMore: 'Club News',
                          ),
                          ItemNewsVideo(
                            textColor: AppColors.black,
                            isClub: true,
                            isVideo: false,
                            textMore: 'Club News',
                          ),
                          ItemNewsVideo(
                            textColor: AppColors.black,
                            isClub: true,
                            isVideo: false,
                            textMore: 'Club News',
                          ),
                        ],
                      ),
              ),
              const SizedBox(
                height: AppSize.size10,
              ),
            ],
          ),
        ),
        const SizedBox(height: AppSize.size15),
        const GradientLine(margin: AppSize.size10),
        Container(
          color: AppColors.white,
          padding: const EdgeInsets.symmetric(vertical: AppSize.size10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(
                    width: AppSize.size10,
                  ),
                  TextCustom(
                    text: 'RelatedVideos'.tr,
                    color: AppColors.black,
                    fontSize: AppSize.size16,
                    weight: FontFamily.medium,
                  ),
                ],
              ),
              const SizedBox(
                height: AppSize.size10,
              ),
              Container(
                height: AppSize.size2,
                width: AppSize.sizeWidthApp,
                color: AppColors.grey.withOpacity(0.3),
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: AppSize.size20, vertical: AppSize.size10),
                child: controller.listVideos.isEmpty
                    ? Center(
                        child: TextCustom(
                          text: 'Nomatchinfoyet'.tr,
                          color: AppColors.black,
                        ),
                      )
                    : Column(
                        children: const [
                          ItemNewsVideo(
                            textColor: AppColors.black,
                          ),
                          ItemNewsVideo(
                            textColor: AppColors.black,
                          ),
                          ItemNewsVideo(
                            textColor: AppColors.black,
                          ),
                        ],
                      ),
              ),
              const SizedBox(
                height: AppSize.size10,
              ),
              // Container(
              //   height: AppSize.size2,
              //   width: AppSize.sizeWidthApp,
              //   color: AppColors.grey.withOpacity(0.3),
              // ),
            ],
          ),
        ),
      ],
    ));
  }
}
