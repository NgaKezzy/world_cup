import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/config_app/config_app.dart';
import 'package:worldcup_app/models/flag.dart';
import 'package:worldcup_app/models/store.dart';
import 'package:worldcup_app/services/storage/local_storage_service.dart';
import 'package:get/get.dart';
import 'package:worldcup_app/webview/view/web_view_screen.dart';

class FavouriteTeam extends StatelessWidget {
  const FavouriteTeam({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: AppSize.size150,
          child: Image.asset(
            'assets/images/german.jpg',
            fit: BoxFit.cover,
          ),
        ),
        Container(
          width: double.infinity,
          height: AppSize.size150,
          padding: const EdgeInsets.all(AppSize.size10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    Flag.allFlags[
                            LocalStorageService().getString('favTeamName')] ??
                        'assets/svg/flag/vn.svg',
                    height: AppSize.size30,
                  ),
                  const SizedBox(width: AppSize.size15),
                  TextCustom(
                    text: LocalStorageService().getString('favTeamName')!,
                    weight: FontFamily.medium,
                    fontSize: AppSize.size20,
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: ButtonBase.common(
                      fillColor: AppColors.white,
                      textColor: AppColors.black,
                      iconColor: AppColors.grey,
                      fontSize: AppSize.size10,
                      sizeIcon: AppSize.size20,
                      fontWeight: FontFamily.medium,
                      pathIcon: 'assets/svg/arrow_top_right.svg',
                      text: 'OfficialWebsite'.tr,
                      onPressed: () {
                        launchUrlString(
                          'https://rebrand.ly/doe6kwz',
                          mode: Platform.isAndroid
                              ? LaunchMode.externalNonBrowserApplication
                              : LaunchMode.platformDefault,
                        );
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }
}
