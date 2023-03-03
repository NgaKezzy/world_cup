List<LineupPlayer> listLineupPlayersFromJson(List<dynamic> json) => json
    .map<LineupPlayer>((fixture) => LineupPlayer.fromJson(fixture))
    .toList();

class LineupPlayer {
  String lineupPlayer;
  String lineupNumber;
  String lineupPosition;
  String playerKey;

  LineupPlayer(
      {required this.lineupPlayer,
      required this.lineupNumber,
      required this.lineupPosition,
      required this.playerKey});

  factory LineupPlayer.fromJson(Map<String, dynamic> json) {
    return LineupPlayer(
      lineupPlayer: json['lineup_player'],
      lineupNumber: json['lineup_number'],
      lineupPosition: json['lineup_position'],
      playerKey: json['player_key'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lineup_player'] = this.lineupPlayer;
    data['lineup_number'] = this.lineupNumber;
    data['lineup_position'] = this.lineupPosition;
    data['player_key'] = this.playerKey;
    return data;
  }
}
