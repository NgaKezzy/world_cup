List<GoalScorer> listGoalScorersFromJson(List<dynamic> json) =>
    json.map<GoalScorer>((fixture) => GoalScorer.fromJson(fixture)).toList();

class GoalScorer {
  String time;
  String homeScorer;
  String homeScorerId;
  String homeAssist;
  String homeAssistId;
  String score;
  String awayScorer;
  String awayScorerId;
  String awayAssist;
  String awayAssistId;
  String info;
  String scoreInfoTime;

  GoalScorer(
      {required this.time,
      required this.homeScorer,
      required this.homeScorerId,
      required this.homeAssist,
      required this.homeAssistId,
      required this.score,
      required this.awayScorer,
      required this.awayScorerId,
      required this.awayAssist,
      required this.awayAssistId,
      required this.info,
      required this.scoreInfoTime});

  factory GoalScorer.fromJson(Map<String, dynamic> json) {
    return GoalScorer(
      time: json['time'],
      homeScorer: json['home_scorer'],
      homeScorerId: json['home_scorer_id'],
      homeAssist: json['home_assist'],
      homeAssistId: json['home_assist_id'],
      score: json['score'],
      awayScorer: json['away_scorer'],
      awayScorerId: json['away_scorer_id'],
      awayAssist: json['away_assist'],
      awayAssistId: json['away_assist_id'],
      info: json['info'],
      scoreInfoTime: json['score_info_time'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    data['home_scorer'] = this.homeScorer;
    data['home_scorer_id'] = this.homeScorerId;
    data['home_assist'] = this.homeAssist;
    data['home_assist_id'] = this.homeAssistId;
    data['score'] = this.score;
    data['away_scorer'] = this.awayScorer;
    data['away_scorer_id'] = this.awayScorerId;
    data['away_assist'] = this.awayAssist;
    data['away_assist_id'] = this.awayAssistId;
    data['info'] = this.info;
    data['score_info_time'] = this.scoreInfoTime;
    return data;
  }
}
