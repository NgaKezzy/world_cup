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
import 'package:worldcup_app/latest_video/controllers/latest_video_controller.dart';
import 'package:worldcup_app/player_video/view/player_video_screen.dart';

class LatestVideo extends GetView<LatestVideoController> {
  const LatestVideo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderView(
              "Latest Videos",
            ),
            Expanded(
              child: Obx(
                () => controller.isLoading
                    ? const LoadingBase(
                        color: AppColors.red_99,
                      )
                    : controller.listVideos.isEmpty
                        ? Center(
                            child: TextCustom(
                              text: 'ThereAreNoVideo'.tr,
                              color: AppColors.black,
                            ),
                          )
                        : Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppSize.size10,
                              vertical: AppSize.size10,
                            ),
                            child: ListView.builder(
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: controller.listVideos.length,
                              itemBuilder: (BuildContext context, int index) {
                                return ItemNewsVideo(
                                  isVideo: true,
                                  isShowAd: false,
                                  highLight: controller.listVideos[index],
                                  textColor: AppColors.black,
                                );
                              },
                            ),
                          ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItemVideoAndNew(
      {Color textColor = AppColors.white,
      bool isVideo = true,
      bool isShowAd = true,
      bool isClub = false,
      String textMore = 'Country News'}) {
    return Column(
      children: [
        GestureDetector(
          onTap: () => Get.to(
            () => const PlayerVideoScreen(
              id: 'B4KyVLJUg4U',
            ),
            transition: Transition.downToUp,
            duration: const Duration(milliseconds: 600),
          ),
          child: Row(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: AppSize.size90,
                    child: Image.asset(
                      'assets/images/thumb_image.jpg',
                    ),
                  ),
                  if (isVideo)
                    Container(
                      height: AppSize.size90,
                      padding: const EdgeInsets.all(AppSize.size8),
                      child: Column(
                        children: [
                          Spacer(),
                          Container(
                            width: AppSize.size65,
                            color: Colors.white,
                            child: Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: AppSize.size1),
                                  height: AppSize.size25,
                                  color: AppColors.pink,
                                  child: SvgPicture.asset(
                                    'assets/svg/play.svg',
                                    color: AppColors.white,
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    height: AppSize.size25,
                                    color: AppColors.purple,
                                    child: Center(
                                      child: TextCustom(
                                        text: '2:21',
                                        weight: FontFamily.medium,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                ],
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(
                      left: AppSize.size15, right: AppSize.size10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      if (isClub)
                        Align(
                          alignment: Alignment.centerLeft,
                          child: TextCustom(
                            text: textMore,
                            fontSize: AppSize.size12,
                            color: AppColors.pink,
                            fontStyle: FontStyle.italic,
                            weight: FontFamily.medium,
                          ),
                        ),
                      if (isClub) const SizedBox(height: AppSize.size5),
                      TextCustom(
                        text: 'FPL experts\' ultimate Wildcard squad',
                        fontSize: AppSize.size14,
                        color: textColor,
                      ),
                      const SizedBox(height: AppSize.size5),
                      if (isShowAd)
                        Row(
                          children: [
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: AppSize.size4,
                                    vertical: AppSize.size2,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      AppSize.size5,
                                    ),
                                    color: AppColors.white.withOpacity(0.5),
                                  ),
                                  child: TextCustomNotAutoScale(
                                    text: 'AD',
                                    fontSize: AppSize.size8,
                                    height: 1.2,
                                  ),
                                ),
                                const SizedBox(width: AppSize.size5),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: AppSize.size4,
                                    vertical: AppSize.size2,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                      AppSize.size5,
                                    ),
                                    color: AppColors.white.withOpacity(0.5),
                                  ),
                                  child: TextCustomNotAutoScale(
                                    text: 'CC',
                                    fontSize: AppSize.size8,
                                    height: 1.2,
                                  ),
                                ),
                                const SizedBox(width: AppSize.size5),
                              ],
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: AppSize.size8),
      ],
    );
  }
}
