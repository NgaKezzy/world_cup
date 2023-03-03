List<TopScore> listTopScoresFromJson(List<dynamic> json) =>
    json.map<TopScore>((topScore) => TopScore.fromJson(topScore)).toList();

class TopScore {
  final String playerPlace;
  final String playerName;
  final int playerKey;
  final String teamName;
  final String teamKey;
  final String goals;
  final String assists;
  final String penaltyGoals;
  final String fkStageKey;
  final String stageName;

  TopScore(
      {required this.playerPlace,
      required this.playerName,
      required this.playerKey,
      required this.teamName,
      required this.teamKey,
      required this.goals,
      required this.assists,
      required this.penaltyGoals,
      required this.fkStageKey,
      required this.stageName});

  factory TopScore.fromJson(Map<String, dynamic> json) {
    return TopScore(
      playerPlace: json['player_place'],
      playerName: json['player_name'],
      playerKey: json['player_key'],
      teamName: json['team_name'],
      teamKey: json['team_key'],
      goals: json['goals'],
      assists: json['assists'],
      penaltyGoals: json['penalty_goals'],
      fkStageKey: json['fk_stage_key'],
      stageName: json['stage_name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['player_place'] = this.playerPlace;
    data['player_name'] = this.playerName;
    data['player_key'] = this.playerKey;
    data['team_name'] = this.teamName;
    data['team_key'] = this.teamKey;
    data['goals'] = this.goals;
    data['assists'] = this.assists;
    data['penalty_goals'] = this.penaltyGoals;
    data['fk_stage_key'] = this.fkStageKey;
    data['stage_name'] = this.stageName;
    return data;
  }
}
