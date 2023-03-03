import 'package:get/get.dart';
import 'package:worldcup_app/models/reponse.dart';
import 'package:worldcup_app/models/team/team.dart';
import 'package:worldcup_app/services/repository/football_repo.dart';

class TeamsController extends GetxController {
  RxBool _isLoading = true.obs;
  bool get isLoading => _isLoading.value;
  late Reponse<List<Team>> listTeam;
  final _footballRepository = FootballRepository();
  void fetchListTeams({bool isLoading = false}) async {
    if (isLoading) _isLoading(true);
    var teams = await _footballRepository.getTeams();

    var filterListTeam = teams.dataResponse != null
        ? (teams.dataResponse!.length >= 32
            ? teams.dataResponse!.sublist(0, 32)
            : teams.dataResponse!)
        : <Team>[];
    Reponse<List<Team>> reponse = Reponse(
      error: teams.error,
      dataResponse: filterListTeam,
    );
    listTeam = reponse;
    _isLoading(false);
  }

  @override
  void onInit() {
    fetchListTeams();
    super.onInit();
  }
}
