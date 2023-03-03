import 'package:get/get.dart';
import 'package:worldcup_app/detail_match/controllers/details_match_controller.dart';

class DetailsMatchBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailsMatchController>(() => DetailsMatchController());
  }
}
