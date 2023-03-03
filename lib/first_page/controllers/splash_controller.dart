import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:devicelocale/devicelocale.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:worldcup_app/common/languages/utils/utils.dart';
import 'package:worldcup_app/config_app/app_routes.dart';
import 'package:worldcup_app/first_page/view/splash_screen.dart';
import 'package:worldcup_app/services/api/google_ads_api.dart';
import 'package:worldcup_app/services/storage/local_storage_service.dart';

class SplashController extends GetxController {
  RxBool isLoading = false.obs;
  String leagueId = '';
  Future<void> loadConfig() async {
    if (LocalStorageService().isExistKey('shortName') &&
        LocalStorageService().isExistKey('countryName')) {
      var codeName = LocalStorageService().getString('shortName');
      var codeCountry = LocalStorageService().getString('countryName');
      Get.updateLocale(Locale(codeName!, codeCountry));
    }
    if (LocalStorageService().isExistKey('isFirstLoad')) {
      if (LocalStorageService().getBool('isFirstLoad')!) {
        navigationPage();
      } else {
        await Future.delayed(
          const Duration(seconds: 2),
          () async => Get.offAllNamed(AppRoutes.home),
        );
      }
    } else {
      navigationPage();
    }
  }

  void navigationPage() async {
    await Future.delayed(
      const Duration(seconds: 2),
      () async => Get.offNamed(
        AppRoutes.chooseFavTeam,
      ),
    );
  }

  Future<void> setAutoLanguage() async {
    List? languages = await Devicelocale.preferredLanguages;
    print('Đây là lang: ${languages?[0]}');
    List<String> autoChooseLanguages = [];

    if (languages != null || languages!.isNotEmpty) {
      var validStringLang = validLang(languages[0]);
      autoChooseLanguages = validStringLang.split('-');
    } else {
      autoChooseLanguages = ['en', 'US'];
    }
    print('Đây là lang sau: $autoChooseLanguages');
    LocalStorageService().setString('shortName', autoChooseLanguages[0]);
    LocalStorageService().setString('countryName', autoChooseLanguages[1]);
    Get.updateLocale(
      Locale(
        autoChooseLanguages[0],
        autoChooseLanguages[1],
      ),
    );
    Jiffy.locale(autoChooseLanguages[0]);
    Get.toNamed(AppRoutes.chooseFavTeam);
  }

  Future<void> getConfigLeagueId() async {
    final collectionConfig = FirebaseFirestore.instance.collection('config');
    final data = await collectionConfig.get();
    if (data.docs.isNotEmpty) {
      LocalStorageService().setString('leagueId', data.docs[0]['leagueId']);
      leagueId = data.docs[0]['leagueId'];
    }
  }

  @override
  void onReady() async {
    super.onReady();
    Future.delayed(Duration(milliseconds: 500), () => isLoading(true));
    await getConfigLeagueId();
    await Future.wait(
      [
        if (LocalStorageService().getBool('isFirstLoad') ?? true)
          setAutoLanguage(),
        GoogleApiAds().initAd('interstitial', GoogleApiAds().interstitialId),
      ],
    );
    final String currentTimeZone =
        await FlutterNativeTimezone.getLocalTimezone();
    LocalStorageService().setString('tz', '${currentTimeZone}');
    loadConfig();
  }
}
