import 'package:get/get.dart';
import 'package:worldcup_app/store/controllers/store_sale_controller.dart';

class StoreSaleBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StoreSaleController>(() => StoreSaleController());
  }
}
