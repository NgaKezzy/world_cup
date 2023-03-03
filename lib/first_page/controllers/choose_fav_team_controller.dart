import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:worldcup_app/first_page/controllers/language_select_controller.dart';
import 'package:worldcup_app/first_page/view/question_add_more_team_screen.dart';
import 'package:worldcup_app/first_page/view/question_receive_mail_screen.dart';
import 'package:worldcup_app/main.dart' as main;
import 'package:worldcup_app/models/team/team.dart';
import 'package:worldcup_app/services/repository/football_repo.dart';
import 'package:worldcup_app/services/storage/local_storage_service.dart';

class ChooseFavTeamController extends GetxController {
  RxBool _isLoading = true.obs;
  RxBool get isLoading => _isLoading;
  late var _dataRepo;
  get dataRepo => _dataRepo;
  RxList<Team> _listTeam = RxList();
  List<Team> get listTeam => _listTeam.value;
  Team? _chooseTeam;
  Team? get chooseTeam => _chooseTeam;
  Team? _chooseOtherTeam;
  Team? get chooseOtherTeam => _chooseOtherTeam;
  final FootballRepository _footballRepo = FootballRepository();

  void getTeams({isLoading = false}) async {
    if (isLoading) _isLoading(true);
    var dataFromRepo = await _footballRepo.getTeams();
    _dataRepo = dataFromRepo;
    if (dataFromRepo.error.isEmpty) {
      var filterListTeam = dataFromRepo.dataResponse!.length >= 32
          ? dataFromRepo.dataResponse!.sublist(0, 32)
          : dataFromRepo.dataResponse!;
      _listTeam.value = filterListTeam;
    }
    _isLoading(false);
  }

  void chooseTeams(index) {
    for (var team in _listTeam) {
      team.isCheck = false;
    }
    _chooseTeam = _listTeam.elementAt(index);
    _chooseTeam?.isCheck = true;
    _listTeam[index] = _chooseTeam!;
  }

  void chooseOtherTeams(index) {
    for (var team in _listTeam) {
      team.isCheck = false;
    }
    _chooseOtherTeam = _listTeam.elementAt(index);
    _chooseOtherTeam?.isCheck = true;
    _listTeam[index] = _chooseOtherTeam!;
  }

  void setFavTeam() {
    if (_chooseTeam != null) {
      LocalStorageService().setString('favTeam', _chooseTeam!.teamKey);
      LocalStorageService().setString('favTeamName', _chooseTeam!.teamName);
      for (var team in _listTeam) {
        team.isCheck = false;
      }
      if (LocalStorageService().getBool('isFirstLoad') ?? true) {
        Get.to(
          () => const QuestionReceiveMailScreen(),
          transition: Transition.leftToRight,
          duration: const Duration(milliseconds: 600),
        );
      } else {
        Fluttertoast.showToast(msg: 'Chooseasuccessfulteam'.tr);
        reloadData();
        Get.back();
        // Restart.restartApp();
      }
    } else
      Fluttertoast.showToast(msg: 'Chooseyourfavoriteteamfirst'.tr);
  }

  void setOtherTeam() {
    if (_chooseOtherTeam != null) {
      LocalStorageService().setString('otherTeam', _chooseOtherTeam!.teamKey);
      for (var team in _listTeam) {
        team.isCheck = false;
      }
      if (LocalStorageService().getBool('isFirstLoad') ?? true) {
        Get.to(
          () => const QuestionReceiveMailScreen(),
          transition: Transition.leftToRight,
          duration: const Duration(milliseconds: 600),
        );
      } else {
        Fluttertoast.showToast(msg: 'Chooseasuccessfulteam'.tr);
        Get.back();
      }
    } else
      Fluttertoast.showToast(msg: 'Choosetheteamfirst'.tr);
  }

  @override
  void onInit() {
    getTeams();
    super.onInit();
  }
}
