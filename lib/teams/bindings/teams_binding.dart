import 'package:get/get.dart';
import 'package:worldcup_app/teams/controllers/teams_controller.dart';

class TeamsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TeamsController>(() => TeamsController());
  }
}
