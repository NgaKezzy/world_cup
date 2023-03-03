import 'dart:convert';
import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/instance_manager.dart';
import 'package:worldcup_app/config_app/app_api.dart';
import 'package:worldcup_app/config_app/app_routes.dart';
import 'package:worldcup_app/first_page/controllers/splash_controller.dart';
import 'package:worldcup_app/models/fixture.dart';
import 'package:worldcup_app/models/headtohead/head_to_head.dart';
import 'package:worldcup_app/models/player/player.dart';
import 'package:worldcup_app/models/player/player_information.dart';
import 'package:worldcup_app/models/ranking/ranking_item.dart';
import 'package:worldcup_app/models/reponse.dart';
import 'package:worldcup_app/models/statistic/statistic.dart';
import 'package:worldcup_app/models/team/team.dart';
import 'package:worldcup_app/models/topscore/top_score.dart';
import 'package:worldcup_app/services/api/football_api.dart';
import 'package:worldcup_app/services/storage/local_storage_service.dart';

class FootballRepository {
  FootballApi footballApi = FootballApi();

  // Hàm khởi tạo chung
  Future<Reponse<T>> getDataRepo<T>(
      {required Map<String, dynamic> params,
      required Function convertFromJson,
      String type = ''}) async {
    Reponse<T> responseData;
    T fixtures;

    var dataRawDecode;
    try {
      var rawFixtures = await footballApi.getRawData(params: params);
      if (rawFixtures.statusCode == 200) {
        dataRawDecode = jsonDecode(rawFixtures.body);
        try {
          if (type != 'players') {
            fixtures = convertFromJson(dataRawDecode);
          } else {
            fixtures = convertFromJson(dataRawDecode[0]['players']);
          }
        } catch (e) {
          fixtures = convertFromJson(dataRawDecode[0]['players']);
        }

        responseData = Reponse(
          error: '',
          dataResponse: fixtures,
        );
      } else {
        responseData = Reponse(
          error: 'Lỗi ${rawFixtures.statusCode}',
        );
      }
    } on HandshakeException catch (e) {
      responseData = Reponse(
        error: 'Lỗi không có kết nối',
      );
    } catch (e) {
      if (dataRawDecode.runtimeType == Map && dataRawDecode?['error'] != null) {
        responseData = Reponse(
          error: dataRawDecode['message'],
        );
      } else {
        responseData = Reponse(
          error: 'Lỗi $e',
        );
        print('Lỗi $e');
      }
    }
    return responseData;
  }

  // Repo lấy danh sách kết quả và lịch thi đấu
  Future<Reponse<List<Fixture>>> getFixtures({
    String from = '2022-11-13',
    String to = '2022-12-18',
    String? leagueId,
    String? matchId,
    String? teamId,
  }) async {
    Map<String, dynamic> params = {
      AppApi.action: AppApi.getEvents,
      AppApi.timezone:
          LocalStorageService().getString('tz') ?? AppApi.timezoneVN,
      AppApi.from: from,
      AppApi.to: to,
      AppApi.leagueId: leagueId ?? AppApi.leagueMain,
      AppApi.apiKey: dotenv.get('KEY_API'),
      if (matchId != null) AppApi.matchId: matchId,
      if (teamId != null) AppApi.teamId: teamId,
    };
    var response = await getDataRepo<List<Fixture>>(
      params: params,
      convertFromJson: listFixturesFromJson,
    );
    return response;
  }

  // Danh sách bảng xếp hạng
  Future<Reponse<List<RankingItem>>> getStandings({
    String? leagueId,
  }) async {
    Map<String, dynamic> params = {
      AppApi.action: AppApi.getStandings,
      AppApi.leagueId: leagueId ?? AppApi.leagueMain,
      AppApi.apiKey: dotenv.get('KEY_API'),
    };
    var response = await getDataRepo<List<RankingItem>>(
      params: params,
      convertFromJson: listRankingItemsFromJson,
    );
    return response;
  }

  // Danh sách lần đối đầu
  Future<Reponse<HeadToHead>> getH2H({
    required String firtsTeamId,
    required String secondTeamId,
  }) async {
    Map<String, dynamic> params = {
      AppApi.action: AppApi.getH2H,
      AppApi.firstTeamId: firtsTeamId,
      AppApi.secondTeamId: secondTeamId,
      AppApi.apiKey: dotenv.get('KEY_API'),
    };
    var response = await getDataRepo<HeadToHead>(
      params: params,
      convertFromJson: HeadToHead.fromJson,
    );
    return response;
  }

  // Thông tin của trận đấu
  Future<Reponse<Statistic>> getStatisticMatch({
    required String matchId,
  }) async {
    Map<String, dynamic> params = {
      AppApi.action: AppApi.getStatics,
      AppApi.matchId: matchId,
      AppApi.apiKey: dotenv.get('KEY_API'),
    };
    var response = await getDataRepo<Statistic>(
      params: params,
      convertFromJson: Statistic.fromJson,
    );
    return response;
  }

  // Danh sách teams
  Future<Reponse<List<Team>>> getTeams() async {
    SplashController controller = Get.find();
    Map<String, dynamic> params = {
      AppApi.action: AppApi.getTeams,
      AppApi.leagueId: LocalStorageService().getString('leagueId'),
      AppApi.apiKey: dotenv.get('KEY_API'),
    };
    var response = await getDataRepo<List<Team>>(
      params: params,
      convertFromJson: listTeamsFromJson,
    );
    return response;
  }

  Future<Reponse<List<PlayerInformation>>> getPlayers(
      {required int playerId}) async {
    Map<String, dynamic> params = {
      AppApi.action: AppApi.getPlayers,
      AppApi.playerId: playerId.toString(),
      AppApi.apiKey: dotenv.get('KEY_API'),
    };
    var response = await getDataRepo<List<PlayerInformation>>(
        params: params, convertFromJson: listPlayerInformationsFromJson);
    return response;
  }

  Future<Reponse<List<Player>>> getPlayersTeam({required String teamId}) async {
    Map<String, dynamic> params = {
      AppApi.action: AppApi.getTeams,
      AppApi.leagueId: AppApi.leagueMain,
      AppApi.teamId: teamId,
      AppApi.apiKey: dotenv.get('KEY_API'),
    };
    var response = await getDataRepo<List<Player>>(
        params: params, convertFromJson: listPlayersFromJson, type: 'players');
    return response;
  }

  Future<Reponse<List<TopScore>>> getTopScore({String? leagueId}) async {
    Map<String, dynamic> params = {
      AppApi.action: AppApi.getTopScorers,
      AppApi.leagueId: leagueId ?? AppApi.leagueMain,
      AppApi.apiKey: dotenv.get('KEY_API'),
    };
    var response = await getDataRepo<List<TopScore>>(
        params: params, convertFromJson: listTopScoresFromJson);
    return response;
  }
}
