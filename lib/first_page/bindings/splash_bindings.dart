import 'package:get/get.dart';
import 'package:worldcup_app/first_page/controllers/splash_controller.dart';

class SplashBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<SplashController>(SplashController());
  }
}
