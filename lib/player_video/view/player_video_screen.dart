import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_font.dart';
import 'package:worldcup_app/config_app/app_size.dart';
import 'package:worldcup_app/home_page/controllers/main_home_controller.dart';
import 'package:worldcup_app/models/firebase/highlight.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlayerVideoScreen extends StatefulWidget {
  final String id;
  final HighLight? highLight;
  const PlayerVideoScreen({Key? key, required this.id, this.highLight})
      : super(key: key);

  @override
  State<PlayerVideoScreen> createState() => _PlayerVideoScreenState();
}

class _PlayerVideoScreenState extends State<PlayerVideoScreen> {
  late YoutubePlayerController _controller;
  bool _isExit = true;
  @override
  void initState() {
    _controller = YoutubePlayerController(
      initialVideoId: widget.id,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: true,
        isLive: false,
        forceHD: true,
        enableCaption: false,
        hideThumbnail: true,
        showLiveFullscreenButton: false,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MainHomeController homeController = Get.find();
    return BaseScreen(
      child: YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: _controller,
          width: AppSize.sizeWidthApp,
          bottomActions: [],
        ),
        builder: (context, player) => Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  color: AppColors.black.withOpacity(.7),
                  padding: const EdgeInsets.symmetric(vertical: AppSize.size50),
                  child: player,
                ),
                InkWell(
                  onTap: () => Get.back(),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSize.size10,
                      vertical: AppSize.size65,
                    ),
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: AppColors.white.withOpacity(.8),
                    ),
                  ),
                ),
              ],
            ),
            if (_isExit)
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSize.size10,
                  vertical: AppSize.size10,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TextCustom(
                        text: widget.highLight?.title ??
                            'Goal of the day: Di Canio\'s wonder strike',
                        color: AppColors.white,
                        fontSize: AppSize.size18,
                        weight: FontFamily.medium,
                      ),
                    ),
                    TextCustom(
                      text: widget.highLight?.description ??
                          '"Watch and admire!" Enjoy the Italian\'s flick-up and volley for West Ham at Chelsea in 2002,"',
                    ),
                  ],
                ),
              ),
            Spacer(),
            InkWell(
              onTap: () => launchUrlString(
                'https://rebrand.ly/saleoffwc',
                mode: Platform.isAndroid
                    ? LaunchMode.externalNonBrowserApplication
                    : LaunchMode.platformDefault,
              ),
              child: CachedNetworkImage(imageUrl: homeController.bannerImage),
            ),
          ],
        ),
      ),
    );
  }
}
