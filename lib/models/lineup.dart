import 'package:worldcup_app/models/lineup_details.dart';

class Lineup {
  LineUpDetails home;
  LineUpDetails away;

  Lineup({required this.home, required this.away});

  factory Lineup.fromJson(Map<String, dynamic> json) {
    return Lineup(
      home: LineUpDetails.fromJson(json['home']),
      away: LineUpDetails.fromJson(json['away']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'home': home,
      'away': away,
    };
  }
}
