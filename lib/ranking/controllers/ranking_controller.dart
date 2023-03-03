import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:worldcup_app/models/ranking/ranking_item.dart';
import 'package:worldcup_app/models/reponse.dart';
import 'package:worldcup_app/services/repository/football_repo.dart';

class RankingController extends GetxController {
  late var dataStanding;
  RxBool isLoading = true.obs;
  final FootballRepository _footballRepository = FootballRepository();
  final RefreshController _refreshController = RefreshController();
  RefreshController get refreshController => _refreshController;

  Future getStandings({bool isReloading = false}) async {
    if (isReloading) isLoading(true);
    var fixtureFromRepo = await _footballRepository.getStandings();
    if (fixtureFromRepo.error.isEmpty && fixtureFromRepo.dataResponse != null) {
      Set<String> group = {};
      List<List<RankingItem>> listGroup = [];
      fixtureFromRepo.dataResponse!.forEach((rankingItem) {
        group.add(rankingItem.leagueRound);
      });

      for (var itemGroup in group) {
        List<RankingItem> listRanking = [];
        fixtureFromRepo.dataResponse!.forEach((rankingItem) {
          if (itemGroup == rankingItem.leagueRound) {
            listRanking.add(rankingItem);
          }
        });
        listGroup.add(listRanking);
      }
      dataStanding = Reponse(
        dataResponse: listGroup,
        error: fixtureFromRepo.error,
      );
    } else {
      dataStanding = fixtureFromRepo;
    }
    _refreshController.loadComplete();
    isLoading(false);
  }

  @override
  void onInit() {
    super.onInit();
    getStandings();
  }
}
