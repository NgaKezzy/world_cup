import 'package:worldcup_app/models/headtohead/head_to_head_item.dart';

class HeadToHead {
  final List<HeadToHeadItem> firstTeamLastResult;
  final List<HeadToHeadItem> firstTeamVSSecondTeam;
  final List<HeadToHeadItem> secondTeamLastResult;
  final int firstTeamWins;
  final int secondTeamWins;
  final int total;
  final int fHome;
  final int fAway;
  final int sHome;
  final int sAway;
  const HeadToHead({
    required this.firstTeamLastResult,
    required this.firstTeamVSSecondTeam,
    required this.secondTeamLastResult,
    this.firstTeamWins = 0,
    this.secondTeamWins = 0,
    this.total = 0,
    this.fHome = 0,
    this.fAway = 0,
    this.sHome = 0,
    this.sAway = 0,
  });

  factory HeadToHead.fromJson(Map<String, dynamic> json) {
    return HeadToHead(
      firstTeamVSSecondTeam:
          listHeadToHeadItemsFromJson(json['firstTeam_VS_secondTeam']),
      firstTeamLastResult:
          listHeadToHeadItemsFromJson(json['firstTeam_lastResults']),
      secondTeamLastResult:
          listHeadToHeadItemsFromJson(json['secondTeam_lastResults']),
    );
  }
}
