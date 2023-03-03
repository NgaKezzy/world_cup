List<PlayerInformation> listPlayerInformationsFromJson(List<dynamic> json) =>
    json
        .map<PlayerInformation>((player) => PlayerInformation.fromJson(player))
        .toList();

class PlayerInformation {
  int playerKey;
  String playerId;
  String playerImage;
  String playerName;
  String playerNumber;
  String playerCountry;
  String playerType;
  String playerAge;
  String playerBirthdate;
  String playerMatchPlayed;
  String playerGoals;
  String playerYellowCards;
  String playerRedCards;
  String playerMinutes;
  String playerInjured;
  String playerSubstituteOut;
  String playerSubstitutesOnBench;
  String playerAssists;
  String playerIsCaptain;
  String playerShotsTotal;
  String playerGoalsConceded;
  String playerFoulsCommitted;
  String playerTackles;
  String playerBlocks;
  String playerCrossesTotal;
  String playerInterceptions;
  String playerClearances;
  String playerDispossesed;
  String playerSaves;
  String playerInsideBoxSaves;
  String playerDuelsTotal;
  String playerDuelsWon;
  String playerDribbleAttempts;
  String playerDribbleSucc;
  String playerPenComm;
  String playerPenWon;
  String playerPenScored;
  String playerPenMissed;
  String playerPasses;
  String playerPassesAccuracy;
  String playerKeyPasses;
  String playerWoordworks;
  String playerRating;
  String teamName;
  String teamKey;

  PlayerInformation(
      {required this.playerKey,
      required this.playerId,
      required this.playerImage,
      required this.playerName,
      required this.playerNumber,
      required this.playerCountry,
      required this.playerType,
      required this.playerAge,
      required this.playerBirthdate,
      required this.playerMatchPlayed,
      required this.playerGoals,
      required this.playerYellowCards,
      required this.playerRedCards,
      required this.playerMinutes,
      required this.playerInjured,
      required this.playerSubstituteOut,
      required this.playerSubstitutesOnBench,
      required this.playerAssists,
      required this.playerIsCaptain,
      required this.playerShotsTotal,
      required this.playerGoalsConceded,
      required this.playerFoulsCommitted,
      required this.playerTackles,
      required this.playerBlocks,
      required this.playerCrossesTotal,
      required this.playerInterceptions,
      required this.playerClearances,
      required this.playerDispossesed,
      required this.playerSaves,
      required this.playerInsideBoxSaves,
      required this.playerDuelsTotal,
      required this.playerDuelsWon,
      required this.playerDribbleAttempts,
      required this.playerDribbleSucc,
      required this.playerPenComm,
      required this.playerPenWon,
      required this.playerPenScored,
      required this.playerPenMissed,
      required this.playerPasses,
      required this.playerPassesAccuracy,
      required this.playerKeyPasses,
      required this.playerWoordworks,
      required this.playerRating,
      required this.teamName,
      required this.teamKey});

  factory PlayerInformation.fromJson(Map<String, dynamic> json) {
    return PlayerInformation(
      playerKey: json['player_key'],
      playerId: json['player_id'],
      playerImage: json['player_image'],
      playerName: json['player_name'],
      playerNumber: json['player_number'],
      playerCountry: json['player_country'],
      playerType: json['player_type'],
      playerAge: json['player_age'],
      playerBirthdate: json['player_birthdate'],
      playerMatchPlayed: json['player_match_played'],
      playerGoals: json['player_goals'],
      playerYellowCards: json['player_yellow_cards'],
      playerRedCards: json['player_red_cards'],
      playerMinutes: json['player_minutes'],
      playerInjured: json['player_injured'],
      playerSubstituteOut: json['player_substitute_out'],
      playerSubstitutesOnBench: json['player_substitutes_on_bench'],
      playerAssists: json['player_assists'],
      playerIsCaptain: json['player_is_captain'],
      playerShotsTotal: json['player_shots_total'],
      playerGoalsConceded: json['player_goals_conceded'],
      playerFoulsCommitted: json['player_fouls_committed'],
      playerTackles: json['player_tackles'],
      playerBlocks: json['player_blocks'],
      playerCrossesTotal: json['player_crosses_total'],
      playerInterceptions: json['player_interceptions'],
      playerClearances: json['player_clearances'],
      playerDispossesed: json['player_dispossesed'],
      playerSaves: json['player_saves'],
      playerInsideBoxSaves: json['player_inside_box_saves'],
      playerDuelsTotal: json['player_duels_total'],
      playerDuelsWon: json['player_duels_won'],
      playerDribbleAttempts: json['player_dribble_attempts'],
      playerDribbleSucc: json['player_dribble_succ'],
      playerPenComm: json['player_pen_comm'],
      playerPenWon: json['player_pen_won'],
      playerPenScored: json['player_pen_scored'],
      playerPenMissed: json['player_pen_missed'],
      playerPasses: json['player_passes'],
      playerPassesAccuracy: json['player_passes_accuracy'],
      playerKeyPasses: json['player_key_passes'],
      playerWoordworks: json['player_woordworks'],
      playerRating: json['player_rating'],
      teamName: json['team_name'],
      teamKey: json['team_key'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['player_key'] = playerKey;
    data['player_id'] = playerId;
    data['player_image'] = playerImage;
    data['player_name'] = playerName;
    data['player_number'] = playerNumber;
    data['player_country'] = playerCountry;
    data['player_type'] = playerType;
    data['player_age'] = playerAge;
    data['player_birthdate'] = playerBirthdate;
    data['player_match_played'] = playerMatchPlayed;
    data['player_goals'] = playerGoals;
    data['player_yellow_cards'] = playerYellowCards;
    data['player_red_cards'] = playerRedCards;
    data['player_minutes'] = playerMinutes;
    data['player_injured'] = playerInjured;
    data['player_substitute_out'] = playerSubstituteOut;
    data['player_substitutes_on_bench'] = playerSubstitutesOnBench;
    data['player_assists'] = playerAssists;
    data['player_is_captain'] = playerIsCaptain;
    data['player_shots_total'] = playerShotsTotal;
    data['player_goals_conceded'] = playerGoalsConceded;
    data['player_fouls_committed'] = playerFoulsCommitted;
    data['player_tackles'] = playerTackles;
    data['player_blocks'] = playerBlocks;
    data['player_crosses_total'] = playerCrossesTotal;
    data['player_interceptions'] = playerInterceptions;
    data['player_clearances'] = playerClearances;
    data['player_dispossesed'] = playerDispossesed;
    data['player_saves'] = playerSaves;
    data['player_inside_box_saves'] = playerInsideBoxSaves;
    data['player_duels_total'] = playerDuelsTotal;
    data['player_duels_won'] = playerDuelsWon;
    data['player_dribble_attempts'] = playerDribbleAttempts;
    data['player_dribble_succ'] = playerDribbleSucc;
    data['player_pen_comm'] = playerPenComm;
    data['player_pen_won'] = playerPenWon;
    data['player_pen_scored'] = playerPenScored;
    data['player_pen_missed'] = playerPenMissed;
    data['player_passes'] = playerPasses;
    data['player_passes_accuracy'] = playerPassesAccuracy;
    data['player_key_passes'] = playerKeyPasses;
    data['player_woordworks'] = playerWoordworks;
    data['player_rating'] = playerRating;
    data['team_name'] = teamName;
    data['team_key'] = teamKey;
    return data;
  }
}
