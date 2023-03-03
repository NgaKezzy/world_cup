import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/common/widgets/item_new_video.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_font.dart';

import 'package:worldcup_app/config_app/app_size.dart';
import 'package:worldcup_app/details_team/controllers/details_team_controller.dart';
import 'package:worldcup_app/home_page/view/worldcup/widgets/buttom_overview.dart';
import 'package:worldcup_app/home_page/view/worldcup/widgets/header_grey.dart';
import 'package:worldcup_app/home_page/view/worldcup/widgets/item_related_news.dart';
import 'package:worldcup_app/home_page/view/worldcup/widgets/item_related_videos.dart';
import 'package:worldcup_app/home_page/view/worldcup/widgets/item_shirt.dart';
import 'package:worldcup_app/home_page/view/worldcup/widgets/item_web.dart';

class ItemNews extends GetView<DetailsTeamController> {
  const ItemNews({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: AppSize.size20),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppColors.white,
            ),
            width: AppSize.sizeWidthApp,
            child: Column(
              children: [
                HeaderGrey(txtHeader: 'latestVideo'.tr),
                Container(
                  width: AppSize.sizeWidthApp,
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSize.size10,
                    vertical: AppSize.size20,
                  ),
                  child: controller.listVideos.isEmpty
                      ? Center(
                          child: TextCustom(
                            text: 'Noteamdataavailableyet'.tr,
                            color: AppColors.black,
                          ),
                        )
                      : Column(
                          children: [
                            for (var highlight in controller.listVideos)
                              ItemNewsVideo(
                                textColor: AppColors.black,
                                highLight: highlight,
                                isVideo: true,
                                isShowAd: false,
                              ),
                          ],
                        ),
                ),
                Container(
                  height: AppSize.size2,
                  width: AppSize.sizeWidthApp,
                  color: AppColors.grey_f2f,
                ),
                const SizedBox(
                  height: AppSize.size30,
                )
              ],
            ),
          ),
          const SizedBox(height: AppSize.size20),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppColors.white,
            ),
            width: AppSize.sizeWidthApp,
            child: Column(
              children: [
                HeaderGrey(txtHeader: 'latestNew'.tr),
                Container(
                  width: AppSize.sizeWidthApp,
                  padding: const EdgeInsets.symmetric(
                      horizontal: AppSize.size10, vertical: AppSize.size20),
                  child: controller.listNews.isEmpty
                      ? Center(
                          child: TextCustom(
                            text: 'Noteamdataavailableyet'.tr,
                            color: AppColors.black,
                          ),
                        )
                      : Column(
                          children: [
                            for (var news in controller.listNews)
                              ItemNewsVideo(
                                textColor: AppColors.black,
                                highLight: news,
                                isVideo: false,
                                isShowAd: false,
                                isClub: true,
                                textMore: news.team,
                              ),
                          ],
                        ),
                ),
                Container(
                  height: AppSize.size2,
                  width: AppSize.sizeWidthApp,
                  color: AppColors.grey_f2f,
                ),
                const SizedBox(
                  height: AppSize.size30,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
