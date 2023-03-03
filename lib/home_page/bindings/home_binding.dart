import 'package:get/get.dart';
import 'package:worldcup_app/detail_match/controllers/details_match_controller.dart';
import 'package:worldcup_app/home_page/controllers/fixtures_controller.dart';
import 'package:worldcup_app/home_page/controllers/latest_home_controller.dart';
import 'package:worldcup_app/home_page/controllers/main_home_controller.dart';
import 'package:worldcup_app/home_page/controllers/stats_controller.dart';
import 'package:worldcup_app/home_page/controllers/worldcup_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LatestHomeController>(() => LatestHomeController());
    Get.lazyPut<MainHomeController>(() => MainHomeController());
    Get.put<FixturesController>(FixturesController());
    Get.put<WorldCupController>(WorldCupController());
    Get.put<StatsController>(StatsController());
  }
}
