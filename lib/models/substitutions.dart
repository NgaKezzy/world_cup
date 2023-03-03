import 'package:worldcup_app/models/fixture/item_substitution.dart';

class Substitutions {
  List<ItemSubstitution> home;
  List<ItemSubstitution> away;

  Substitutions({required this.home, required this.away});

  factory Substitutions.fromJson(Map<String, dynamic> json) {
    return Substitutions(
      home: listItemSubstitutionsFromJson(json['home']),
      away: listItemSubstitutionsFromJson(json['away']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'home': home,
      'away': away,
    };
  }
}
