import 'package:get/get.dart';
import 'package:worldcup_app/ranking/controllers/ranking_controller.dart';

class RakingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RankingController>(() => RankingController());
  }
}
