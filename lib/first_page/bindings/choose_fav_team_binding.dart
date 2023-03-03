import 'package:get/get.dart';
import 'package:worldcup_app/first_page/controllers/choose_fav_team_controller.dart';

class ChooseFavTeamBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChooseFavTeamController>(() => ChooseFavTeamController());
  }
}
