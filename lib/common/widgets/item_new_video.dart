import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/common/widgets/loading_base.dart';
import 'package:worldcup_app/config_app/config_app.dart';
import 'package:worldcup_app/details_news/view/details_news.dart';
import 'package:worldcup_app/models/firebase/highlight.dart';
import 'package:worldcup_app/player_video/view/player_video_screen.dart';

class ItemNewsVideo extends StatelessWidget {
  final Color textColor;
  final bool isVideo;
  final bool isShowAd;
  final bool isClub;
  final String textMore;
  final HighLight? highLight;
  const ItemNewsVideo({
    super.key,
    this.textColor = AppColors.white,
    this.isVideo = true,
    this.isShowAd = true,
    this.isClub = false,
    this.textMore = 'Country News',
    this.highLight,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            if (!isVideo) {
              Get.to(
                () => DetailsNewsScreen(
                  news: highLight!,
                ),
              );
            } else {
              Get.to(
                () => PlayerVideoScreen(
                  id: highLight?.videoId ?? 'B4KyVLJUg4U',
                  highLight: highLight,
                ),
                transition: Transition.downToUp,
                duration: const Duration(milliseconds: 600),
              );
            }
          },
          child: Row(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: AppSize.size90,
                    width: AppSize.size_latest,
                    child: CachedNetworkImage(
                      imageUrl: highLight!.imageUrl,
                      fit: BoxFit.cover,
                      errorWidget: (context, error, stackTrace) => Image.asset(
                        'assets/images/thumb_image.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  if (isVideo)
                    Container(
                      height: AppSize.size90,
                      padding: const EdgeInsets.all(AppSize.size8),
                      child: Column(
                        children: [
                          const Spacer(),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                        text: highLight?.title ??
                            'FPL experts\' ultimate Wildcard squad',
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
