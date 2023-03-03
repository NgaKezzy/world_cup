import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:worldcup_app/models/reponse.dart';
import 'package:worldcup_app/models/topscore/top_score.dart';
import 'package:worldcup_app/services/repository/football_repo.dart';

class StatsController extends GetxController {
  RxBool _isLoading = true.obs;
  bool get isLoading => _isLoading.value;

  late Reponse<List<TopScore>> listTopScores;

  final _footballRepository = FootballRepository();

  void getTopScore({bool isLoading = false}) async {
    if (isLoading) _isLoading(true);
    var topScores = await _footballRepository.getTopScore();
    listTopScores = topScores;
    _isLoading(false);
  }

  @override
  void onInit() {
    getTopScore();
    super.onInit();
  }
}
