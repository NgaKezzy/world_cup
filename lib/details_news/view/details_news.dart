import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_font.dart';
import 'package:worldcup_app/config_app/app_size.dart';
import 'package:worldcup_app/details_news/controllers/details_news_controller.dart';
import 'package:worldcup_app/home_page/controllers/main_home_controller.dart';
import 'package:worldcup_app/home_page/view/worldcup/widgets/item_related_news.dart';
import 'package:worldcup_app/home_page/view/worldcup/widgets/item_related_videos.dart';
import 'package:worldcup_app/models/firebase/highlight.dart';
import 'package:worldcup_app/models/firebase/section.dart';

class DetailsNewsScreen extends StatelessWidget {
  final HighLight news;
  const DetailsNewsScreen({
    Key? key,
    required this.news,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MainHomeController homeController = Get.find();
    return BaseScreen(
      child: SafeArea(
        child: Column(
          children: [
            HeaderBase(
              text: 'News',
              onTap: () => Get.back(),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: AppSize.sizeWidthApp,
                    padding:
                        const EdgeInsets.symmetric(horizontal: AppSize.size20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextCustom(
                            text: news.type,
                            color: AppColors.pink,
                            fontSize: AppSize.size15,
                            weight: FontFamily.semiBold),
                        TextCustom(
                          text: news.title,
                          fontSize: AppSize.size20,
                          weight: FontFamily.semiBold,
                        ),
                        TextCustom(
                          text: DateFormat('yyyy-MM-dd, hh:mm')
                              .format(news.created.toDate()),
                        ),
                        const SizedBox(height: AppSize.size5),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Stack(
                      children: [
                        Container(
                          width: AppSize.sizeWidthApp,
                          color: AppColors.white,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                CachedNetworkImage(imageUrl: news.imageUrl),
                                const SizedBox(height: AppSize.size10),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      for (var section in news.section)
                                        _buildTextNews(section),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: AppSize.size190),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: AppSize.sizeWidthApp,
                          child: Column(
                            children: [
                              Spacer(),
                              InkWell(
                                onTap: () => launchUrlString(
                                  'https://rebrand.ly/saleoffwc',
                                  mode: Platform.isAndroid
                                      ? LaunchMode.externalNonBrowserApplication
                                      : LaunchMode.platformDefault,
                                ),
                                child: CachedNetworkImage(
                                  imageUrl: homeController.bannerImage,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildTextNews(Section section) {
    Widget child;
    switch (section.type) {
      case 'title':
        child = Column(
          children: [
            TextCustom(
              text: section.content,
              color: AppColors.black,
              fontSize: AppSize.size14,
              weight: FontFamily.medium,
            ),
            const SizedBox(height: AppSize.size10),
          ],
        );
        break;
      case 'text':
        child = Column(
          children: [
            const SizedBox(height: AppSize.size10),
            TextCustom(
              text: section.content,
              color: AppColors.black,
            ),
            const SizedBox(height: AppSize.size10),
          ],
        );
        break;
      default:
        child = const SizedBox();
    }
    return child;
  }
}
