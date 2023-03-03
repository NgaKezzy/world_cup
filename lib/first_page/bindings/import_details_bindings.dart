import 'package:get/get.dart';
import 'package:worldcup_app/first_page/controllers/import_details_controller.dart';

class ImportDetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ImportDetailsController>(() => ImportDetailsController());
  }
}
