List<RankingItem> listRankingItemsFromJson(List<dynamic> json) => json
    .map<RankingItem>((itemRanking) => RankingItem.fromJson(itemRanking))
    .toList();

class RankingItem {
  String countryName;
  String leagueId;
  String leagueName;
  String teamId;
  String teamName;
  String overallPromotion;
  String overallLeaguePosition;
  String overallLeaguePayed;
  String overallLeagueW;
  String overallLeagueD;
  String overallLeagueL;
  String overallLeagueGF;
  String overallLeagueGA;
  String overallLeaguePTS;
  String homeLeaguePosition;
  String homePromotion;
  String homeLeaguePayed;
  String homeLeagueW;
  String homeLeagueD;
  String homeLeagueL;
  String homeLeagueGF;
  String homeLeagueGA;
  String homeLeaguePTS;
  String awayLeaguePosition;
  String awayPromotion;
  String awayLeaguePayed;
  String awayLeagueW;
  String awayLeagueD;
  String awayLeagueL;
  String awayLeagueGF;
  String awayLeagueGA;
  String awayLeaguePTS;
  String leagueRound;
  String teamBadge;
  String fkStageKey;
  String stageName;

  RankingItem(
      {required this.countryName,
      required this.leagueId,
      required this.leagueName,
      required this.teamId,
      required this.teamName,
      required this.overallPromotion,
      required this.overallLeaguePosition,
      required this.overallLeaguePayed,
      required this.overallLeagueW,
      required this.overallLeagueD,
      required this.overallLeagueL,
      required this.overallLeagueGF,
      required this.overallLeagueGA,
      required this.overallLeaguePTS,
      required this.homeLeaguePosition,
      required this.homePromotion,
      required this.homeLeaguePayed,
      required this.homeLeagueW,
      required this.homeLeagueD,
      required this.homeLeagueL,
      required this.homeLeagueGF,
      required this.homeLeagueGA,
      required this.homeLeaguePTS,
      required this.awayLeaguePosition,
      required this.awayPromotion,
      required this.awayLeaguePayed,
      required this.awayLeagueW,
      required this.awayLeagueD,
      required this.awayLeagueL,
      required this.awayLeagueGF,
      required this.awayLeagueGA,
      required this.awayLeaguePTS,
      required this.leagueRound,
      required this.teamBadge,
      required this.fkStageKey,
      required this.stageName});

  factory RankingItem.fromJson(Map<String, dynamic> json) {
    return RankingItem(
      countryName: json['country_name'],
      leagueId: json['league_id'],
      leagueName: json['league_name'],
      teamId: json['team_id'],
      teamName: json['team_name'],
      overallPromotion: json['overall_promotion'],
      overallLeaguePosition: json['overall_league_position'],
      overallLeaguePayed: json['overall_league_payed'],
      overallLeagueW: json['overall_league_W'],
      overallLeagueD: json['overall_league_D'],
      overallLeagueL: json['overall_league_L'],
      overallLeagueGF: json['overall_league_GF'],
      overallLeagueGA: json['overall_league_GA'],
      overallLeaguePTS: json['overall_league_PTS'],
      homeLeaguePosition: json['home_league_position'],
      homePromotion: json['home_promotion'],
      homeLeaguePayed: json['home_league_payed'],
      homeLeagueW: json['home_league_W'],
      homeLeagueD: json['home_league_D'],
      homeLeagueL: json['home_league_L'],
      homeLeagueGF: json['home_league_GF'],
      homeLeagueGA: json['home_league_GA'],
      homeLeaguePTS: json['home_league_PTS'],
      awayLeaguePosition: json['away_league_position'],
      awayPromotion: json['away_promotion'],
      awayLeaguePayed: json['away_league_payed'],
      awayLeagueW: json['away_league_W'],
      awayLeagueD: json['away_league_D'],
      awayLeagueL: json['away_league_L'],
      awayLeagueGF: json['away_league_GF'],
      awayLeagueGA: json['away_league_GA'],
      awayLeaguePTS: json['away_league_PTS'],
      leagueRound: json['league_round'],
      teamBadge: json['team_badge'],
      fkStageKey: json['fk_stage_key'],
      stageName: json['stage_name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['country_name'] = countryName;
    data['league_id'] = leagueId;
    data['league_name'] = leagueName;
    data['team_id'] = teamId;
    data['team_name'] = teamName;
    data['overall_promotion'] = overallPromotion;
    data['overall_league_position'] = overallLeaguePosition;
    data['overall_league_payed'] = overallLeaguePayed;
    data['overall_league_W'] = overallLeagueW;
    data['overall_league_D'] = overallLeagueD;
    data['overall_league_L'] = overallLeagueL;
    data['overall_league_GF'] = overallLeagueGF;
    data['overall_league_GA'] = overallLeagueGA;
    data['overall_league_PTS'] = overallLeaguePTS;
    data['home_league_position'] = homeLeaguePosition;
    data['home_promotion'] = homePromotion;
    data['home_league_payed'] = homeLeaguePayed;
    data['home_league_W'] = homeLeagueW;
    data['home_league_D'] = homeLeagueD;
    data['home_league_L'] = homeLeagueL;
    data['home_league_GF'] = homeLeagueGF;
    data['home_league_GA'] = homeLeagueGA;
    data['home_league_PTS'] = homeLeaguePTS;
    data['away_league_position'] = awayLeaguePosition;
    data['away_promotion'] = awayPromotion;
    data['away_league_payed'] = awayLeaguePayed;
    data['away_league_W'] = awayLeagueW;
    data['away_league_D'] = awayLeagueD;
    data['away_league_L'] = awayLeagueL;
    data['away_league_GF'] = awayLeagueGF;
    data['away_league_GA'] = awayLeagueGA;
    data['away_league_PTS'] = awayLeaguePTS;
    data['league_round'] = leagueRound;
    data['team_badge'] = teamBadge;
    data['fk_stage_key'] = fkStageKey;
    data['stage_name'] = stageName;
    return data;
  }
}
