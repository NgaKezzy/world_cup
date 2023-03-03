List<Player> listPlayersFromJson(List<dynamic> json) =>
    json.map<Player>((player) => Player.fromJson(player)).toList();

class Player {
  int playerKey;
  String playerId;
  String playerImage;
  String playerName;
  String playerNumber;
  String playerCountry;
  String playerType;
  String playerAge;
  String playerMatchPlayed;
  String playerGoals;
  String playerYellowCards;
  String playerRedCards;
  String playerInjured;
  String playerSubstituteOut;
  String playerSubstitutesOnBench;
  String playerAssists;
  String playerBirthdate;
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

  Player(
      {required this.playerKey,
      required this.playerId,
      required this.playerImage,
      required this.playerName,
      required this.playerNumber,
      required this.playerCountry,
      required this.playerType,
      required this.playerAge,
      required this.playerMatchPlayed,
      required this.playerGoals,
      required this.playerYellowCards,
      required this.playerRedCards,
      required this.playerInjured,
      required this.playerSubstituteOut,
      required this.playerSubstitutesOnBench,
      required this.playerAssists,
      required this.playerBirthdate,
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
      required this.playerRating});

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      playerKey: json['player_key'],
      playerId: json['player_id'],
      playerImage: json['player_image'],
      playerName: json['player_name'],
      playerNumber: json['player_number'],
      playerCountry: json['player_country'],
      playerType: json['player_type'],
      playerAge: json['player_age'],
      playerMatchPlayed: json['player_match_played'],
      playerGoals: json['player_goals'],
      playerYellowCards: json['player_yellow_cards'],
      playerRedCards: json['player_red_cards'],
      playerInjured: json['player_injured'],
      playerSubstituteOut: json['player_substitute_out'],
      playerSubstitutesOnBench: json['player_substitutes_on_bench'],
      playerAssists: json['player_assists'],
      playerBirthdate: json['player_birthdate'],
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
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['player_key'] = this.playerKey;
    data['player_id'] = this.playerId;
    data['player_image'] = this.playerImage;
    data['player_name'] = this.playerName;
    data['player_number'] = this.playerNumber;
    data['player_country'] = this.playerCountry;
    data['player_type'] = this.playerType;
    data['player_age'] = this.playerAge;
    data['player_match_played'] = this.playerMatchPlayed;
    data['player_goals'] = this.playerGoals;
    data['player_yellow_cards'] = this.playerYellowCards;
    data['player_red_cards'] = this.playerRedCards;
    data['player_injured'] = this.playerInjured;
    data['player_substitute_out'] = this.playerSubstituteOut;
    data['player_substitutes_on_bench'] = this.playerSubstitutesOnBench;
    data['player_assists'] = this.playerAssists;
    data['player_birthdate'] = this.playerBirthdate;
    data['player_is_captain'] = this.playerIsCaptain;
    data['player_shots_total'] = this.playerShotsTotal;
    data['player_goals_conceded'] = this.playerGoalsConceded;
    data['player_fouls_committed'] = this.playerFoulsCommitted;
    data['player_tackles'] = this.playerTackles;
    data['player_blocks'] = this.playerBlocks;
    data['player_crosses_total'] = this.playerCrossesTotal;
    data['player_interceptions'] = this.playerInterceptions;
    data['player_clearances'] = this.playerClearances;
    data['player_dispossesed'] = this.playerDispossesed;
    data['player_saves'] = this.playerSaves;
    data['player_inside_box_saves'] = this.playerInsideBoxSaves;
    data['player_duels_total'] = this.playerDuelsTotal;
    data['player_duels_won'] = this.playerDuelsWon;
    data['player_dribble_attempts'] = this.playerDribbleAttempts;
    data['player_dribble_succ'] = this.playerDribbleSucc;
    data['player_pen_comm'] = this.playerPenComm;
    data['player_pen_won'] = this.playerPenWon;
    data['player_pen_scored'] = this.playerPenScored;
    data['player_pen_missed'] = this.playerPenMissed;
    data['player_passes'] = this.playerPasses;
    data['player_passes_accuracy'] = this.playerPassesAccuracy;
    data['player_key_passes'] = this.playerKeyPasses;
    data['player_woordworks'] = this.playerWoordworks;
    data['player_rating'] = this.playerRating;
    return data;
  }
}
