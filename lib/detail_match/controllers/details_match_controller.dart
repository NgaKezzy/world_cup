import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:worldcup_app/config_app/app_api.dart';
import 'package:worldcup_app/models/firebase/highlight.dart';
import 'package:worldcup_app/models/firebase/section.dart';
import 'package:worldcup_app/models/headtohead/head_to_head.dart';
import 'package:worldcup_app/models/headtohead/head_to_head_item.dart';
import 'package:worldcup_app/models/reponse.dart';
import 'package:worldcup_app/services/repository/football_repo.dart';
import 'package:worldcup_app/services/storage/local_storage_service.dart';

class DetailsMatchController extends GetxController {
  late var _dataHeadToHead;
  // RxMap<String, dynamic> args = RxMap({});
  get dataHeadToHead => _dataHeadToHead;
  late var _dataStatisticMatch;
  // RxMap<String, dynamic> args = RxMap({});
  get dataStatisticMatch => _dataStatisticMatch;
  RxBool isLoading = true.obs;
  final RefreshController _refreshController = RefreshController();
  RefreshController get refreshController => _refreshController;

  FootballRepository footballRepository = FootballRepository();

  List<HighLight> listNews = [];
  List<HighLight> listVideos = [];

  final args = Get.arguments;

  final instanceFireStore = FirebaseFirestore.instance;
  final instanceFireStorage = FirebaseStorage.instance.ref();

  Future<void> getHeadToHead(String firstTeamdd, String secondTeamId,
      {bool isReloading = false}) async {
    if (isReloading) isLoading(true);
    var headToHeadFromRepo = await footballRepository.getH2H(
        firtsTeamId: firstTeamdd, secondTeamId: secondTeamId);
    if (headToHeadFromRepo.error.isEmpty &&
        headToHeadFromRepo.dataResponse != null) {
      final List<HeadToHeadItem> listFvS = [];
      final List<HeadToHeadItem> listF = [];
      final List<HeadToHeadItem> listS = [];
      int total = 0;
      int sWins = 0;
      int fWins = 0;
      int fHome = 0;
      int fAway = 0;
      int sHome = 0;
      int sAway = 0;
      for (var fvS in headToHeadFromRepo.dataResponse!.firstTeamVSSecondTeam) {
        if (fvS.leagueId == AppApi.leagueMain) {
          listFvS.add(fvS);
        }
      }

      for (var itemH2H in listFvS) {
        switch (itemH2H.matchHometeamId) {
          case '21':
            if (int.parse(itemH2H.matchHometeamScore) >
                int.parse(itemH2H.matchAwayteamScore)) {
              sWins += 1;
              sHome += 1;
            } else {
              fWins += 1;
              fAway += 1;
            }
            break;
          case '19':
            if (int.parse(itemH2H.matchHometeamScore) >
                int.parse(itemH2H.matchAwayteamScore)) {
              fWins += 1;
              fHome += 1;
            } else {
              sWins += 1;
              sAway += 1;
            }
            break;
          default:
        }
        total += 1;
      }

      for (var fvS in headToHeadFromRepo.dataResponse!.firstTeamLastResult) {
        if (fvS.leagueId == AppApi.leagueMain) {
          listF.add(fvS);
        }
      }
      for (var fvS in headToHeadFromRepo.dataResponse!.secondTeamLastResult) {
        if (fvS.leagueId == AppApi.leagueMain) {
          listS.add(fvS);
        }
      }
      _dataHeadToHead = Reponse<HeadToHead>(
        dataResponse: HeadToHead(
          firstTeamLastResult: listS,
          firstTeamVSSecondTeam: listFvS,
          secondTeamLastResult: listF,
          total: total,
          firstTeamWins: fWins,
          secondTeamWins: sWins,
          fAway: fAway,
          fHome: fHome,
          sAway: sAway,
          sHome: sHome,
        ),
        error: headToHeadFromRepo.error,
      );
    } else {
      _dataHeadToHead = headToHeadFromRepo;
    }
    // _refreshController.loadComplete();
  }

  Future<void> getMatchStatistic(String date, String matchId,
      {bool isReloading = false}) async {
    if (isReloading) isLoading(true);
    var headToHeadFromRepo = await footballRepository.getFixtures(
      matchId: matchId,
      from: '',
      to: '',
    );
    _dataStatisticMatch = headToHeadFromRepo;
    // _refreshController.loadComplete();
    print('object');
  }

  Future getNews() async {
    final newsCollection = instanceFireStore.collection(AppApi.news);
    late final listData;

    listData = await newsCollection
        .where('lang', isEqualTo: LocalStorageService().getString('shortName'))
        .where('team', isEqualTo: args['nameHome'].toLowerCase())
        .get();

    for (var highLight in listData.docs) {
      var pathString =
          await instanceFireStorage.child(highLight['image']).getDownloadURL();
      var instanceNews = HighLight(
        description: highLight['description'],
        title: highLight['title'],
        videoId: '',
        imageUrl: pathString,
        type: highLight['type'],
        team: highLight['team'],
        section: listSectionsFromJson(highLight['section']),
        created: highLight['created'],
      );
      listNews.add(instanceNews);
    }
  }

  Future getVideos() async {
    final highlightCollection = instanceFireStore.collection(AppApi.highlight);
    late final listData;
    listData = await highlightCollection
        .where('lang', isEqualTo: LocalStorageService().getString('shortName'))
        .where('type', isEqualTo: args['nameHome'].toLowerCase())
        .get();

    for (var highLight in listData.docs) {
      var pathString =
          await instanceFireStorage.child(highLight['image']).getDownloadURL();
      var instanceNews = HighLight(
        description: highLight['description'],
        title: highLight['title'],
        videoId: highLight['videoId'],
        imageUrl: pathString,
        type: highLight['type'],
        section: [],
        team: '',
        created: highLight['created'],
      );
      listVideos.add(instanceNews);
    }
  }

  Future<void> getAll(
      {bool isReloading = false,
      required String id1,
      required String id2,
      required String date,
      required String matchId}) async {
    await Future.wait([
      getHeadToHead(id1, id2),
      getMatchStatistic(date, matchId),
      getVideos(),
      getNews(),
    ]);

    isLoading(false);
  }

  Future<void> refresh() async {
    var args = Get.arguments;
    await getAll(
      date: args['date'],
      id1: args['idHome'],
      id2: args['idAway'],
      matchId: args['matchId'],
    );
  }

  @override
  void onReady() async {
    var args = Get.arguments;
    getAll(
      date: args['date'],
      id1: args['idHome'],
      id2: args['idAway'],
      matchId: args['matchId'],
    );
    super.onReady();
  }
}
