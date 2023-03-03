List<ItemSubstitution> listItemSubstitutionsFromJson(List<dynamic> json) => json
    .map<ItemSubstitution>((fixture) => ItemSubstitution.fromJson(fixture))
    .toList();

class ItemSubstitution {
  String time;
  String substitution;
  String substitutionPlayerId;

  ItemSubstitution(
      {required this.time,
      required this.substitution,
      required this.substitutionPlayerId});

  factory ItemSubstitution.fromJson(Map<String, dynamic> json) {
    return ItemSubstitution(
      time: json['time'],
      substitution: json['substitution'],
      substitutionPlayerId: json['substitution_player_id'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['time'] = this.time;
    data['substitution'] = this.substitution;
    data['substitution_player_id'] = this.substitutionPlayerId;
    return data;
  }
}
