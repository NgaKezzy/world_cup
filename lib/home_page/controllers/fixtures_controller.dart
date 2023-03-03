import 'dart:async';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:worldcup_app/models/fixture.dart';
import 'package:worldcup_app/models/reponse.dart';
import 'package:worldcup_app/services/repository/football_repo.dart';

class FixturesController extends GetxController {
  late var dataFixture;
  RxBool isLive = false.obs;
  Rx<Fixture>? fixtureLive;
  RxBool isLoading = true.obs;
  final RefreshController _refreshController = RefreshController();
  RefreshController get refreshController => _refreshController;

  FootballRepository footballRepository = FootballRepository();

  Future getFixtures({bool isReloading = false}) async {
    if (isReloading) isLoading(true);
    var fixtureFromRepo = await footballRepository.getFixtures();
    if (fixtureFromRepo.error.isEmpty && fixtureFromRepo.dataResponse != null) {
      Set<String> setString = {};

      fixtureFromRepo.dataResponse?.forEach((fixture) {
        setString.add(fixture.matchDate);
      });
      List<List<Fixture>> convertFixtureByDay = [];

      for (var date in setString) {
        final List<Fixture> listFixture = [];
        fixtureFromRepo.dataResponse?.forEach((fixture) {
          if (fixture.matchDate == date) listFixture.add(fixture);
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
    _refreshController.loadComplete();
    isLoading(false);
  }

  Future liveScore() async {
    Timer.periodic(new Duration(seconds: 10), (timer) async {
      final DateTime now = DateTime.now();
      final DateFormat formatter = DateFormat('yyyy-MM-dd');
      final String current = formatter.format(now);
      var fixtureFromRepo = await footballRepository.getFixtures(
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
    });
  }

  @override
  void onInit() {
    log('Gọi init');
    Future.wait([
      getFixtures(),
      liveScore(),
    ]);
    super.onInit();
  }
}
