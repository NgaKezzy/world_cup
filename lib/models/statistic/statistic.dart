import 'package:worldcup_app/models/statistic/item_statistic.dart';
import 'package:worldcup_app/models/statistic/player_statistic.dart';

class Statistic {
  List<ItemStatistic> statistics;
  List<ItemStatistic> statistics1half;
  List<PlayerStatistics> playerStatistics;

  Statistic(
      {required this.statistics,
      required this.statistics1half,
      required this.playerStatistics});

  factory Statistic.fromJson(Map<String, dynamic> json) {
    return Statistic(
        playerStatistics: listPlayerStatisticssFromJson(
            json[json.keys.toList().first]['player_statistics']),
        statistics1half: listItemStatisticsFromJson(
            json[json.keys.toList().first]['statistics_1half']),
        statistics: listItemStatisticsFromJson(
            json[json.keys.toList().first]['statistics']));
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['statistics'] = this.statistics.map((v) => v.toJson()).toList();
    data['statistics_1half'] =
        this.statistics1half.map((v) => v.toJson()).toList();
    data['player_statistics'] =
        this.playerStatistics.map((v) => v.toJson()).toList();
    return data;
  }
}
