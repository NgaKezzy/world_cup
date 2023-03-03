import 'package:get/get.dart';
import 'package:worldcup_app/details_team/controllers/details_team_controller.dart';

class DetailsTeamBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailsTeamController>(() => DetailsTeamController());
  }
}
