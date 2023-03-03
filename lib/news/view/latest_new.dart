import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/common/widgets/header_view.dart';
import 'package:worldcup_app/common/widgets/item_new_video.dart';
import 'package:worldcup_app/common/widgets/loading_base.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_font.dart';
import 'package:worldcup_app/config_app/app_size.dart';
import 'package:worldcup_app/news/controllers/latest_new_controller.dart';
import 'package:worldcup_app/player_video/view/player_video_screen.dart';

class LatestNew extends GetView<LatestNewsController> {
  const LatestNew({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => controller.isLoading
            ? const LoadingBase(
                color: AppColors.red_99,
              )
            : SafeArea(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeaderView(
                      controller.args['team'].isNotEmpty
                          ? controller.args['team']
                          : "Latest News",
                    ),
                    Expanded(
                      child: controller.listNews.isEmpty
                          ? Center(
                              child: TextCustom(
                                text: 'CurrentNo'.tr,
                                color: AppColors.black,
                              ),
                            )
                          : Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: AppSize.size10),
                              child: ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                padding: const EdgeInsets.symmetric(
                                    vertical: AppSize.size10),
                                itemCount: controller.listNews.length,
                                itemBuilder: (BuildContext context, int index) {
                                  return ItemNewsVideo(
                                    highLight: controller.listNews[index],
                                    isClub: true,
                                    isShowAd: false,
                                    isVideo: false,
                                    textColor: AppColors.black,
                                  );
                                },
                              ),
                            ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
