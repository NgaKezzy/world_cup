import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:worldcup_app/config_app/app_api.dart';
import 'package:worldcup_app/models/firebase/highlight.dart';
import 'package:worldcup_app/models/firebase/section.dart';
import 'package:worldcup_app/models/player/player.dart';
import 'package:worldcup_app/models/reponse.dart';
import 'package:worldcup_app/services/repository/football_repo.dart';
import 'package:worldcup_app/services/storage/local_storage_service.dart';

class DetailsTeamController extends GetxController {
  RxBool _isLoading = true.obs;
  bool get isLoading => _isLoading.value;
  late var listPlayer;
  late var listPlayerNormal;

  List<HighLight> listNews = [];
  List<HighLight> listVideos = [];

  final _footballRepository = FootballRepository();
  final args = Get.arguments;

  final instanceFireStore = FirebaseFirestore.instance;
  final instanceFireStorage = FirebaseStorage.instance.ref();

  Future fetchPlayer({bool isLoading = false}) async {
    if (isLoading) _isLoading(true);
    var players = await _footballRepository.getPlayersTeam(
      teamId: args[AppApi.teamId],
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
  }

  Future getNews() async {
    final newsCollection = instanceFireStore.collection(AppApi.news);
    late final listData;

    listData = await newsCollection
        .where('lang', isEqualTo: LocalStorageService().getString('shortName'))
        .where('team', isEqualTo: args[AppApi.teamName].toLowerCase())
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
        .where('type', isEqualTo: args[AppApi.teamName].toLowerCase())
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

  void getAll() async {
    await fetchPlayer();
    await getNews();
    await getVideos();
    _isLoading(false);
  }

  @override
  void onInit() {
    super.onInit();
    getAll();
  }
}
