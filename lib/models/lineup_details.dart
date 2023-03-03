import 'package:worldcup_app/models/fixture/lineup_player.dart';

class LineUpDetails {
  List<LineupPlayer> startingLineups;
  List<LineupPlayer> substitutes;
  List<LineupPlayer> coach;
  List<LineupPlayer> missingPlayers;

  LineUpDetails(
      {required this.startingLineups,
      required this.substitutes,
      required this.coach,
      required this.missingPlayers});

  factory LineUpDetails.fromJson(Map<String, dynamic> json) {
    return LineUpDetails(
      coach: listLineupPlayersFromJson(json['coach']),
      missingPlayers: listLineupPlayersFromJson(json['missing_players']),
      startingLineups: listLineupPlayersFromJson(json['starting_lineups']),
      substitutes: listLineupPlayersFromJson(json['substitutes']),
    );
  }
}
