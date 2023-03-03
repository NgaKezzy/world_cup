import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:worldcup_app/config_app/app_api.dart';
import 'package:worldcup_app/models/firebase/highlight.dart';
import 'package:worldcup_app/models/firebase/section.dart';
import 'package:worldcup_app/models/fixture.dart';
import 'package:worldcup_app/models/player/player.dart';
import 'package:worldcup_app/models/ranking/ranking_item.dart';
import 'package:worldcup_app/models/reponse.dart';
import 'package:worldcup_app/services/repository/football_repo.dart';
import 'package:worldcup_app/services/storage/local_storage_service.dart';

class WorldCupController extends GetxController {
  late var dataFixture;
  late var dataStanding;

  late var listPlayer;
  late var listPlayerNormal;

  RxBool isLoading = true.obs;
  final RefreshController _refreshController = RefreshController();
  RefreshController get refreshController => _refreshController;

  final FootballRepository _footballRepository = FootballRepository();
  Future getFixtures() async {
    if (LocalStorageService().isExistKey('favTeam')) {
      var fixtureFromRepo = await _footballRepository.getFixtures(
        teamId: LocalStorageService().getString('favTeam'),
      );
      dataFixture = fixtureFromRepo;
    } else {
      dataFixture = [];
    }
  }

  Future fetchPlayer({bool isLoading = false}) async {
    var players;
    if (LocalStorageService().getString('favTeam') != null) {
      players = await _footballRepository.getPlayersTeam(
        teamId: LocalStorageService().getString('favTeam')!,
      );
      if (players.dataResponse!.isNotEmpty && players.error.isEmpty) {
        final Set<String> position = {};
        final List<List<Player>> listPosition = [];
        for (var players in players.dataResponse!) {
          position.add(players.playerType);
        }
        for (var pos in position) {
          List<Player> positionPlayer = [];
          for (var players in players.dataResponse!) {
            if (pos == players.playerType) {
              positionPlayer.add(players);
            }
          }
          listPosition.add(positionPlayer);
        }
        listPlayer = Reponse<List<List<Player>>>(
          dataResponse: listPosition,
          error: players.error,
        );
      } else {
        listPlayer = players;
      }
      listPlayerNormal = players;
    } else {
      listPlayer = Reponse<List<Player>>(
        error: 'Không có dữ liệu',
      );

      listPlayerNormal = Reponse<List<Player>>(
        error: 'Không có dữ liệu',
      );
    }
  }

  Future getStandings() async {
    var fixtureFromRepo = await _footballRepository.getStandings();
    if (fixtureFromRepo.error.isEmpty &&
        fixtureFromRepo.dataResponse != null &&
        LocalStorageService().isExistKey('favTeam')) {
      RankingItem? rankingItem = fixtureFromRepo.dataResponse?.firstWhere(
          (element) =>
              element.teamId == LocalStorageService().getString('favTeam'));
      dataStanding = Reponse<List<RankingItem>>(
          error: fixtureFromRepo.error,
          dataResponse: rankingItem != null ? [rankingItem] : []);
    } else {
      dataStanding = [];
    }
  }

  void getAll({bool isReloading = false}) async {
    if (isReloading) isLoading(true);
    await Future.wait([
      getStandings(),
      getFixtures(),
      fetchPlayer(),
    ]);

    _refreshController.loadComplete();
    isLoading(false);
  }

  @override
  void onInit() {
    getAll();
    super.onInit();
  }
}
