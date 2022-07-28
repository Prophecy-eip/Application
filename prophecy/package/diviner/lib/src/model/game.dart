import 'dart:convert';

import 'army.dart';

Game gameFromJson(String str) => Game.fromJson(json.decode(str));

String gameToJson(Game data) => json.encode(data.toJson());

class Game {
  Game({
    required this.date,
    required this.opponentsId,
    required this.playerArmy,
    required this.opponentArmy,
    required this.playersScore,
    required this.opponentsScore,
    required this.official,
  });

  String date;
  String opponentsId;
  Army playerArmy;
  Army opponentArmy;
  int playersScore;
  int opponentsScore;
  bool official;

  factory Game.fromJson(Map<String, dynamic> json) => Game(
        date: json["date"],
        opponentsId: json["opponentsId"],
        playerArmy: Army.fromJson(json["playerArmy"]),
        opponentArmy: Army.fromJson(json["opponentArmy"]),
        playersScore: json["playersScore"],
        opponentsScore: json["opponentsScore"],
        official: json["official"],
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "opponentsId": opponentsId,
        "playerArmy": playerArmy.toJson(),
        "opponentArmy": opponentArmy.toJson(),
        "playersScore": playersScore,
        "opponentsScore": opponentsScore,
        "official": official,
      };
}
