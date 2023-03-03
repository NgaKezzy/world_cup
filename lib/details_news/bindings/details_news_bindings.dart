import 'package:get/get.dart';
import 'package:worldcup_app/details_news/controllers/details_news_controller.dart';

class DetailsNewsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailsNewsController>(() => DetailsNewsController());
  }
}
