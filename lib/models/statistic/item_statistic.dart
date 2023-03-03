List<ItemStatistic> listItemStatisticsFromJson(List<dynamic> json) => json
    .map<ItemStatistic>((fixture) => ItemStatistic.fromJson(fixture))
    .toList();

class ItemStatistic {
  String type;
  String home;
  String away;

  ItemStatistic({required this.type, required this.home, required this.away});

  factory ItemStatistic.fromJson(Map<String, dynamic> json) {
    return ItemStatistic(
      type: json['type'],
      home: json['home'],
      away: json['away'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['home'] = this.home;
    data['away'] = this.away;
    return data;
  }
}
