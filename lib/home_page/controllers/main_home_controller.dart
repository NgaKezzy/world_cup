import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:worldcup_app/common/controller/main_controller.dart';
import 'package:worldcup_app/game/game_screen.dart';
import 'package:worldcup_app/home_page/view/fixtures/view/fixtures_results_screen.dart';
import 'package:worldcup_app/home_page/view/latest/latest_screen.dart';
import 'package:worldcup_app/home_page/view/more/more_screen.dart';
import 'package:worldcup_app/home_page/view/stats/stats_screen.dart';
import 'package:worldcup_app/home_page/view/worldcup/worldcup_screen.dart';
import 'package:worldcup_app/models/item_navbar.dart';
import 'package:worldcup_app/services/api/google_ads_api.dart';

class MainHomeController extends GetxController {
  final Rx<int> _currentIndex = 0.obs;
  final Rx<int> _count = 0.obs;
  String bannerImage = "";
  int get currentIndex => _currentIndex.value;
  int get count => _count.value;
  List<ItemNavbar> listNavBar = [
    ItemNavbar(label: 'Home'.tr, pathIcon: 'assets/svg/latest.svg'),
    ItemNavbar(label: 'Teams', pathIcon: 'assets/svg/world_cup.svg'),
    ItemNavbar(label: 'match'.tr, pathIcon: 'assets/svg/category.svg'),
    ItemNavbar(label: 'stats'.tr, pathIcon: 'assets/svg/stat.svg'),
    ItemNavbar(label: 'Game', pathIcon: 'assets/svg/game.svg'),
    ItemNavbar(label: 'Setting'.tr, pathIcon: 'assets/svg/more.svg'),
  ];

  final List<Widget> screensHome = [
    LatestScreen(),
    WorldCupScreen(),
    FixturesResultsScreen(),
    StatsScreen(),
    GameScreen(),
    MoreScreen(),
  ];

  void onTapped(int index) {
    _currentIndex.value = index;
    _count.value += 1;
    if (_count.value == 6) {
      GoogleApiAds().showInterstitialAd();
      GoogleApiAds().initAd('banner', GoogleApiAds().bannerId);
    }
  }

  void loadBannerImage() async {
    final collectionConfig = FirebaseFirestore.instance.collection('config');
    final data = await collectionConfig.get();
    if (data.docs.isNotEmpty) {
      final instanceFireStorage = FirebaseStorage.instance.ref();
      var pathString = await instanceFireStorage
          .child(data.docs[0]['banner'])
          .getDownloadURL();
      bannerImage = pathString;
    }
  }

  void reload() {
    listNavBar = [
      ItemNavbar(label: 'Home'.tr, pathIcon: 'assets/svg/latest.svg'),
      ItemNavbar(label: 'Teams', pathIcon: 'assets/svg/world_cup.svg'),
      ItemNavbar(label: 'match'.tr, pathIcon: 'assets/svg/category.svg'),
      ItemNavbar(label: 'stats'.tr, pathIcon: 'assets/svg/stat.svg'),
      ItemNavbar(label: 'Game', pathIcon: 'assets/svg/game.svg'),
      ItemNavbar(label: 'Setting'.tr, pathIcon: 'assets/svg/more.svg'),
    ];
  }

  @override
  void onInit() {
    loadBannerImage();
    super.onInit();
  }
}
