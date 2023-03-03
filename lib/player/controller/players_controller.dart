import 'package:get/get.dart';
import 'package:worldcup_app/config_app/app_api.dart';
import 'package:worldcup_app/models/player/player_information.dart';
import 'package:worldcup_app/models/reponse.dart';
import 'package:worldcup_app/services/repository/football_repo.dart';

class PlayersController extends GetxController {
  Rx<bool> _isLoading = true.obs;
  bool get isLoading => _isLoading.value;
  late var loadingPlayers;
  final args = Get.arguments;

  final FootballRepository _footballRepository = FootballRepository();

  void getPlayersTeam() async {
    var dataPlayerFromRepo =
        await _footballRepository.getPlayers(playerId: args[AppApi.playerId]);
    if (dataPlayerFromRepo.dataResponse != null &&
        dataPlayerFromRepo.error.isEmpty) {
      for (var playerInformation in dataPlayerFromRepo.dataResponse!) {
        if (playerInformation.teamName == args[AppApi.teamName]) {
          loadingPlayers = Reponse<PlayerInformation>(
            dataResponse: playerInformation,
            error: dataPlayerFromRepo.error,
          );
        }
      }
    } else {
      loadingPlayers = dataPlayerFromRepo;
    }
    _isLoading(false);
  }

  @override
  void onInit() {
    getPlayersTeam();
    super.onInit();
  }
}
