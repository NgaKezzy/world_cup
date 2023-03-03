List<Card> listCardsFromJson(List<dynamic> json) =>
    json.map<Card>((fixture) => Card.fromJson(fixture)).toList();

class Card {
  String time;
  String homeFault;
  String card;
  String awayFault;
  String info;
  String homePlayerId;
  String awayPlayerId;
  String scoreInfoTime;

  Card(
      {required this.time,
      required this.homeFault,
      required this.card,
      required this.awayFault,
      required this.info,
      required this.homePlayerId,
      required this.awayPlayerId,
      required this.scoreInfoTime});

  factory Card.fromJson(Map<String, dynamic> json) {
    return Card(
      time: json['time'],
      homeFault: json['home_fault'],
      card: json['card'],
      awayFault: json['away_fault'],
      info: json['info'],
      homePlayerId: json['home_player_id'],
      awayPlayerId: json['away_player_id'],
      scoreInfoTime: json['score_info_time'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    data['home_fault'] = this.homeFault;
    data['card'] = this.card;
    data['away_fault'] = this.awayFault;
    data['info'] = this.info;
    data['home_player_id'] = this.homePlayerId;
    data['away_player_id'] = this.awayPlayerId;
    data['score_info_time'] = this.scoreInfoTime;
    return data;
  }
}
