import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';
import 'package:worldcup_app/config_app/app_routes.dart';
import 'package:worldcup_app/first_page/view/choose_favourite_team_screen.dart';
import 'package:worldcup_app/home_page/controllers/fixtures_controller.dart';
import 'package:worldcup_app/home_page/controllers/latest_home_controller.dart';
import 'package:worldcup_app/home_page/controllers/main_home_controller.dart';
import 'package:worldcup_app/home_page/controllers/stats_controller.dart';
import 'package:worldcup_app/home_page/controllers/worldcup_controller.dart';
import 'package:worldcup_app/main.dart' as main;
import 'package:worldcup_app/models/language/language.dart';
import 'package:worldcup_app/services/storage/local_storage_service.dart';

class LanguageSelectController extends GetxController {
  RxList<Language> _langs = <Language>[].obs;
  Language? _chooseLanguage;
  Language? get chooseLang => _chooseLanguage;
  RxList<Language> get langs => _langs;

  void chooseLanguage(int index) {
    var mirrorLangs = [..._langs.value];
    for (var langItem in mirrorLangs) {
      langItem.isActive = false;
    }
    var lang = mirrorLangs.elementAt(index);
    lang.isActive = true;
    mirrorLangs[index] = lang;
    _langs(mirrorLangs);
    _chooseLanguage = lang;
  }

  void setLang() async {
    if (_chooseLanguage == null) {
      Fluttertoast.showToast(msg: 'Selectthelanguage'.tr);
    } else {
      LocalStorageService().setString('shortName', _chooseLanguage!.nameShort);
      LocalStorageService().setString('countryName', _chooseLanguage!.nameCode);
      Get.updateLocale(
        Locale(
          _chooseLanguage!.nameShort,
          _chooseLanguage!.nameCode,
        ),
      );
      Jiffy.locale(_chooseLanguage!.nameShort);
      Fluttertoast.showToast(
        msg: 'Changelanguagesuccessfully'.tr,
      );
      await reloadData();
      Get.back();
      // Restart.restartApp();
    }
  }

  @override
  void onInit() {
    _langs.value = [
      Language(name: 'English', nameCode: 'US', nameShort: 'en'),
      Language(name: 'French', nameCode: 'FR', nameShort: 'fr'),
      Language(name: 'Portuguese', nameCode: 'BR', nameShort: 'pt'),
      Language(name: 'Spanish', nameCode: 'ES', nameShort: 'es'),
    ];

    super.onInit();
  }
}

Future<void> reloadData() async {
  final FixturesController fixtureController = Get.find();
  final LatestHomeController latestController = Get.find();
  final StatsController statsController = Get.find();
  final WorldCupController wcController = Get.find();
  final MainHomeController homeController = Get.find();
  if (fixtureController.initialized)
    fixtureController.getFixtures(isReloading: true);
  if (latestController.initialized) latestController.getAll(isReloading: true);
  if (statsController.initialized) statsController.getTopScore(isLoading: true);
  if (wcController.initialized) wcController.getAll(isReloading: true);
  homeController.reload();
}
