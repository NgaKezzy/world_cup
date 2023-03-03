List<PlayerStatistics> listPlayerStatisticssFromJson(List<dynamic> json) => json
    .map<PlayerStatistics>((fixture) => PlayerStatistics.fromJson(fixture))
    .toList();

class PlayerStatistics {
  String playerName;
  String playerKey;
  String teamName;
  String playerNumber;
  String playerPosition;
  String playerIsCaptain;
  String playerIsSubst;
  String playerShotsTotal;
  String playerShotsOnGoal;
  String playerGoals;
  String playerGoalsConceded;
  String playerMinusGoals;
  String playerAssists;
  String playerOffsides;
  String playerFoulsDrawn;
  String playerFoulsCommited;
  String playerTackles;
  String playerBlocks;
  String playerTotalCrosses;
  String playerAccCrosses;
  String playerInterceptions;
  String playerClearances;
  String playerDispossesed;
  String playerSaves;
  String playerPunches;
  String playerSavesInsideBox;
  String playerDuelsTotal;
  String playerDuelsWon;
  String playerAerialsWon;
  String playerDribbleAttempts;
  String playerDribbleSucc;
  String playerDribbledPast;
  String playerYellowcards;
  String playerRedcards;
  String playerPenScore;
  String playerPenMiss;
  String playerPenSave;
  String playerPenCommitted;
  String playerPenWon;
  String playerHitWoodwork;
  String playerPasses;
  String playerPassesAcc;
  String playerKeyPasses;
  String playerMinutesPlayed;
  String playerRating;
  String matchId;

  PlayerStatistics(
      {required this.playerName,
      required this.playerKey,
      required this.teamName,
      required this.playerNumber,
      required this.playerPosition,
      required this.playerIsCaptain,
      required this.playerIsSubst,
      required this.playerShotsTotal,
      required this.playerShotsOnGoal,
      required this.playerGoals,
      required this.playerGoalsConceded,
      required this.playerMinusGoals,
      required this.playerAssists,
      required this.playerOffsides,
      required this.playerFoulsDrawn,
      required this.playerFoulsCommited,
      required this.playerTackles,
      required this.playerBlocks,
      required this.playerTotalCrosses,
      required this.playerAccCrosses,
      required this.playerInterceptions,
      required this.playerClearances,
      required this.playerDispossesed,
      required this.playerSaves,
      required this.playerPunches,
      required this.playerSavesInsideBox,
      required this.playerDuelsTotal,
      required this.playerDuelsWon,
      required this.playerAerialsWon,
      required this.playerDribbleAttempts,
      required this.playerDribbleSucc,
      required this.playerDribbledPast,
      required this.playerYellowcards,
      required this.playerRedcards,
      required this.playerPenScore,
      required this.playerPenMiss,
      required this.playerPenSave,
      required this.playerPenCommitted,
      required this.playerPenWon,
      required this.playerHitWoodwork,
      required this.playerPasses,
      required this.playerPassesAcc,
      required this.playerKeyPasses,
      required this.playerMinutesPlayed,
      required this.playerRating,
      required this.matchId});

  factory PlayerStatistics.fromJson(Map<String, dynamic> json) {
    return PlayerStatistics(
      playerName: json['player_name'],
      playerKey: json['player_key'],
      teamName: json['team_name'],
      playerNumber: json['player_number'],
      playerPosition: json['player_position'],
      playerIsCaptain: json['player_is_captain'],
      playerIsSubst: json['player_is_subst'],
      playerShotsTotal: json['player_shots_total'],
      playerShotsOnGoal: json['player_shots_on_goal'],
      playerGoals: json['player_goals'],
      playerGoalsConceded: json['player_goals_conceded'],
      playerMinusGoals: json['player_minus_goals'],
      playerAssists: json['player_assists'],
      playerOffsides: json['player_offsides'],
      playerFoulsDrawn: json['player_fouls_drawn'],
      playerFoulsCommited: json['player_fouls_commited'],
      playerTackles: json['player_tackles'],
      playerBlocks: json['player_blocks'],
      playerTotalCrosses: json['player_total_crosses'],
      playerAccCrosses: json['player_acc_crosses'],
      playerInterceptions: json['player_interceptions'],
      playerClearances: json['player_clearances'],
      playerDispossesed: json['player_dispossesed'],
      playerSaves: json['player_saves'],
      playerPunches: json['player_punches'],
      playerSavesInsideBox: json['player_saves_inside_box'],
      playerDuelsTotal: json['player_duels_total'],
      playerDuelsWon: json['player_duels_won'],
      playerAerialsWon: json['player_aerials_won'],
      playerDribbleAttempts: json['player_dribble_attempts'],
      playerDribbleSucc: json['player_dribble_succ'],
      playerDribbledPast: json['player_dribbled_past'],
      playerYellowcards: json['player_yellowcards'],
      playerRedcards: json['player_redcards'],
      playerPenScore: json['player_pen_score'],
      playerPenMiss: json['player_pen_miss'],
      playerPenSave: json['player_pen_save'],
      playerPenCommitted: json['player_pen_committed'],
      playerPenWon: json['player_pen_won'],
      playerHitWoodwork: json['player_hit_woodwork'],
      playerPasses: json['player_passes'],
      playerPassesAcc: json['player_passes_acc'],
      playerKeyPasses: json['player_key_passes'],
      playerMinutesPlayed: json['player_minutes_played'],
      playerRating: json['player_rating'],
      matchId: json['match_id'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['player_name'] = this.playerName;
    data['player_key'] = this.playerKey;
    data['team_name'] = this.teamName;
    data['player_number'] = this.playerNumber;
    data['player_position'] = this.playerPosition;
    data['player_is_captain'] = this.playerIsCaptain;
    data['player_is_subst'] = this.playerIsSubst;
    data['player_shots_total'] = this.playerShotsTotal;
    data['player_shots_on_goal'] = this.playerShotsOnGoal;
    data['player_goals'] = this.playerGoals;
    data['player_goals_conceded'] = this.playerGoalsConceded;
    data['player_minus_goals'] = this.playerMinusGoals;
    data['player_assists'] = this.playerAssists;
    data['player_offsides'] = this.playerOffsides;
    data['player_fouls_drawn'] = this.playerFoulsDrawn;
    data['player_fouls_commited'] = this.playerFoulsCommited;
    data['player_tackles'] = this.playerTackles;
    data['player_blocks'] = this.playerBlocks;
    data['player_total_crosses'] = this.playerTotalCrosses;
    data['player_acc_crosses'] = this.playerAccCrosses;
    data['player_interceptions'] = this.playerInterceptions;
    data['player_clearances'] = this.playerClearances;
    data['player_dispossesed'] = this.playerDispossesed;
    data['player_saves'] = this.playerSaves;
    data['player_punches'] = this.playerPunches;
    data['player_saves_inside_box'] = this.playerSavesInsideBox;
    data['player_duels_total'] = this.playerDuelsTotal;
    data['player_duels_won'] = this.playerDuelsWon;
    data['player_aerials_won'] = this.playerAerialsWon;
    data['player_dribble_attempts'] = this.playerDribbleAttempts;
    data['player_dribble_succ'] = this.playerDribbleSucc;
    data['player_dribbled_past'] = this.playerDribbledPast;
    data['player_yellowcards'] = this.playerYellowcards;
    data['player_redcards'] = this.playerRedcards;
    data['player_pen_score'] = this.playerPenScore;
    data['player_pen_miss'] = this.playerPenMiss;
    data['player_pen_save'] = this.playerPenSave;
    data['player_pen_committed'] = this.playerPenCommitted;
    data['player_pen_won'] = this.playerPenWon;
    data['player_hit_woodwork'] = this.playerHitWoodwork;
    data['player_passes'] = this.playerPasses;
    data['player_passes_acc'] = this.playerPassesAcc;
    data['player_key_passes'] = this.playerKeyPasses;
    data['player_minutes_played'] = this.playerMinutesPlayed;
    data['player_rating'] = this.playerRating;
    data['match_id'] = this.matchId;
    return data;
  }
}
