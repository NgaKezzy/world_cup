import 'package:get/get.dart';
import 'package:worldcup_app/news/controllers/latest_new_controller.dart';

class LatestNewsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LatestNewsController>(() => LatestNewsController());
  }
}
