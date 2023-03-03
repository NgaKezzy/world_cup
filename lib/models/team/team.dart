List<Team> listTeamsFromJson(List<dynamic> json) =>
    json.map<Team>((team) => Team.fromJson(team)).toList();

class Team {
  String teamKey;
  String teamName;
  String teamBadge;

  bool isCheck;
  Team({
    required this.teamKey,
    required this.teamName,
    required this.teamBadge,
    this.isCheck = false,
  });
  factory Team.fromJson(Map<String, dynamic> json) {
    return Team(
      teamBadge: json['team_badge'],
      teamKey: json['team_key'],
      teamName: json['team_name'],
    );
  }

  Team copyWith(
      {String? teamKey, String? teamName, String? teamBadge, bool? isCheck}) {
    return Team(
      teamBadge: teamBadge ?? this.teamBadge,
      teamKey: teamKey ?? this.teamKey,
      teamName: teamName ?? this.teamName,
      isCheck: isCheck ?? this.isCheck,
    );
  }
}
