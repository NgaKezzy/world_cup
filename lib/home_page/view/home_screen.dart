import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:worldcup_app/common/common.dart';
import 'package:worldcup_app/config_app/app_color.dart';
import 'package:worldcup_app/config_app/app_font.dart';
import 'package:worldcup_app/config_app/app_size.dart';
import 'package:worldcup_app/home_page/controllers/main_home_controller.dart';
import 'package:worldcup_app/home_page/view/fixtures/view/fixtures_results_screen.dart';

import 'package:worldcup_app/models/item_navbar.dart';
import 'package:worldcup_app/services/api/google_ads_api.dart';
import 'package:worldcup_app/services/storage/local_storage_service.dart';

class HomeScreen extends GetView<MainHomeController> {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textStyleBottom = AppStyleCustom.getTextStyle(
      color: AppColors.grey,
      weight: FontFamily.medium,
    );
    return Obx(
      () => BaseScreen(
        color: Colors.blue,
        padding:
            controller.currentIndex * MediaQuery.of(context).size.width / 6,
        bottomNavigationBar: BottomNavigationBar(
          unselectedLabelStyle: textStyleBottom,
          selectedLabelStyle: textStyleBottom,
          fixedColor: AppColors.red_631,
          type: BottomNavigationBarType.fixed,
          onTap: controller.onTapped,
          currentIndex: controller.currentIndex,
          items: [
            for (var i = 0; i < controller.listNavBar.length; i++)
              _builItemNavBar(controller.listNavBar[i],
                  isChoose: i == controller.currentIndex),
          ],
        ),
        child: Stack(
          children: [
            controller.screensHome[controller.currentIndex],
            if (GoogleApiAds().bannerAd != null)
              Container(
                width: AppSize.sizeHeightApp -
                    AppSize.size5 -
                    kBottomNavigationBarHeight,
                child: Column(
                  children: [
                    Spacer(),
                    Container(
                      height: 60,
                      child: AdWidget(ad: GoogleApiAds().bannerAd!),
                    ),
                  ],
                ),
              )
          ],
        ),
      ),
    );
  }

  BottomNavigationBarItem _builItemNavBar(ItemNavbar item,
      {bool isChoose = false}) {
    return BottomNavigationBarItem(
        icon: SvgPicture.asset(
          item.pathIcon,
          height: AppSize.size24,
          color: isChoose ? AppColors.red_631 : AppColors.grey.withOpacity(0.6),
        ),
        label: item.label);
  }
}
