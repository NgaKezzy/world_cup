import 'dart:async';
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:worldcup_app/config_app/app_api.dart';
import 'package:worldcup_app/models/firebase/highlight.dart';
import 'package:worldcup_app/models/firebase/section.dart';
import 'package:worldcup_app/models/fixture.dart';
import 'package:worldcup_app/models/reponse.dart';
import 'package:worldcup_app/services/api/google_ads_api.dart';
import 'package:worldcup_app/services/repository/football_repo.dart';
import 'package:worldcup_app/services/storage/local_storage_service.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as ta;

class LatestHomeController extends GetxController {
  late var dataFixture;
  late var dataStanding;
  Rx<Fixture>? fixtureLive;
  int time = 10;
  RxBool isLive = false.obs;
  List<HighLight> listHighLight = [];
  List<HighLight> listNews = [];
  List<HighLight> listTeamNews = [];
  RxList<Fixture> listDuDoan = <Fixture>[].obs;
  RxList<int> listKQDuDoan = <int>[].obs;
  RxBool isLoading = true.obs;
  final RefreshController _refreshController = RefreshController();
  RefreshController get refreshController => _refreshController;

  final FootballRepository _footballRepository = FootballRepository();
  final instanceFireStore = FirebaseFirestore.instance;
  final instanceFireStorage = FirebaseStorage.instance.ref();

  Future getFixtures() async {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String current = formatter.format(now);
    var fixtureFromRepo = await _footballRepository.getFixtures(from: current);
    if (fixtureFromRepo.error.isEmpty && fixtureFromRepo.dataResponse != null) {
      Set<String> setString = {};

      fixtureFromRepo.dataResponse?.forEach((fixture) {
        setString.add(fixture.matchDate);
      });
      List<List<Fixture>> convertFixtureByDay = [];

      for (var i = 0; i < setString.length; i++) {
        final List<Fixture> listFixture = [];
        fixtureFromRepo.dataResponse?.forEach((fixture) {
          if (fixture.matchDate == setString.elementAt(i))
            listFixture.add(fixture);
        });
        convertFixtureByDay.add(listFixture);
      }
      dataFixture = Reponse<List<List<Fixture>>>(
        error: fixtureFromRepo.error,
        dataResponse: convertFixtureByDay,
      );
    } else {
      dataFixture = fixtureFromRepo;
    }
  }

  Future getStandings() async {
    var fixtureFromRepo = await _footballRepository.getStandings();
    dataStanding = fixtureFromRepo;
  }

  Future getHighlight() async {
    final newsCollection = instanceFireStore.collection(AppApi.highlight);
    final listData = await newsCollection
        .where('lang', isEqualTo: LocalStorageService().getString('shortName'))
        .limit(3)
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
      listHighLight.add(instanceNews);
    }
  }

  Future getNews() async {
    final newsCollection = instanceFireStore.collection(AppApi.news);
    final listData = await newsCollection
        .where('lang', isEqualTo: LocalStorageService().getString('shortName'))
        .limit(3)
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

  Future getTeamNews() async {
    final newsCollection = instanceFireStore.collection(AppApi.news);
    log(LocalStorageService().getString('favTeamName')!.toLowerCase());
    final listData = await newsCollection
        .where('lang', isEqualTo: LocalStorageService().getString('shortName'))
        .where('team',
            isEqualTo:
                LocalStorageService().getString('favTeamName')!.toLowerCase())
        .limit(3)
        .get();
    log(LocalStorageService().getString('shortName').toString());
    log(LocalStorageService()
        .getString('favTeamName')!
        .toLowerCase()
        .toString());
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
      listTeamNews.add(instanceNews);
    }
  }

  Future liveScore() async {
    Timer.periodic(new Duration(seconds: time), (timer) async {
      if (time == 0) time = 10;
      final DateTime now = DateTime.now();
      final DateFormat formatter = DateFormat('yyyy-MM-dd');
      final String current = formatter.format(now);
      var fixtureFromRepo = await _footballRepository.getFixtures(
        from: current,
        to: current,
      );
      if (fixtureFromRepo.dataResponse != null) {
        if (fixtureFromRepo.dataResponse!.isNotEmpty) {
          fixtureFromRepo.dataResponse!.forEach((fixture) {
            if (fixture.matchLive != '0') {
              DateTime time =
                  DateTime.parse('${fixture.matchDate} ${fixture.matchTime}');
              DateTime now = DateTime.now();
              double parse =
                  ((now.millisecondsSinceEpoch - time.millisecondsSinceEpoch) /
                          1000) /
                      60;
              if (0 < parse && parse < 150) {
                if (fixtureLive == null) {
                  fixtureLive = Rx(fixture);
                  isLive(true);
                } else {
                  fixtureLive!(fixture);
                }
              }
            }
          });
        }
      }
      log('Livescore: ${fixtureLive!.value.toString() ?? 'null'}');
    });
  }

  Future getListDuDoan() async {
    final DateTime now = DateTime.now();
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String current = formatter.format(now);
    var fixtureFromRepo = await _footballRepository.getFixtures(
      from: current,
      to: current,
    );
    if (fixtureFromRepo.dataResponse != null) {
      if (fixtureFromRepo.dataResponse!.isNotEmpty) {
        List<Fixture> list = [];
        List<int> listInt = [];
        fixtureFromRepo.dataResponse!.forEach((fixs) {
          if (fixs.matchStatus != 'Finished') {
            list.add(fixs);
            listInt.add(0);
          }
        });
        listDuDoan(list);

        if (LocalStorageService().isExistKey('date')) {
          if (current != LocalStorageService().getString('date')!) {
            LocalStorageService().setString('date', current);
          } else {
            listKQDuDoan(LocalStorageService()
                .getStringList('dudoan')!
                .map((e) => int.parse(e))
                .toList());
          }
        } else {
          LocalStorageService().setString('date', current);
          listKQDuDoan(listInt);
        }
      }
    }
  }

  void onClickChooseDuDoan(int position, int value) {
    List<int> mirror = [...listKQDuDoan.value];
    mirror[position] = value;
    listKQDuDoan(mirror);
    List<String> strList = mirror.map((i) => i.toString()).toList();
    LocalStorageService().setStringList('dudoan', strList);
  }

  void getAll({bool isReloading = false}) async {
    if (isReloading) {
      isLoading(true);
      listHighLight = [];
      listNews = [];
      listTeamNews = [];
    }
    await Future.wait([
      getStandings(),
      getFixtures(),
      getHighlight(),
      getNews(),
      getTeamNews(),
      liveScore(),
      getListDuDoan(),
    ]);
    _refreshController.loadComplete();
    isLoading(false);
  }

  @override
  void onInit() {
    log('Gọi init');
    // if (LocalStorageService().getBool('isFirstLoad') ?? true)
    //   GoogleApiAds().showInterstitialAd();
    if (LocalStorageService().getBool('isFirstLoad') ?? true)
      LocalStorageService().setBool('isFirstLoad', false);
    getAll();
    super.onInit();
  }
}
