import 'package:get/get.dart';
import 'package:worldcup_app/latest_video/controllers/latest_video_controller.dart';

class LatestVideoBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LatestVideoController>(() => LatestVideoController());
  }
}
