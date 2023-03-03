import 'package:get/get.dart';
import 'package:worldcup_app/player/controller/players_controller.dart';

class PlayersBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlayersController>(() => PlayersController());
  }
}
