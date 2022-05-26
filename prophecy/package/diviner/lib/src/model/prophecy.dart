import 'dart:convert';
import 'army.dart';

Prophecy prophecyFromJson(String str) => Prophecy.fromJson(json.decode(str));

String prophecyToJson(Prophecy data) => json.encode(data.toJson());

List<Prophecy> prophecyHistoryFromJson(String str) =>
    List<Prophecy>.from(json.decode(str).map((x) => Prophecy.fromJson(x)));

String prophecyHistoryToJson(List<Prophecy> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Prophecy {
  Prophecy({
    required this.playerArmy,
    required this.opponentArmy,
  });

  Army playerArmy;
  Army opponentArmy;

  factory Prophecy.fromJson(Map<String, dynamic> json) => Prophecy(
        playerArmy: Army.fromJson(json["playerArmy"]),
        opponentArmy: Army.fromJson(json["opponentArmy"]),
      );

  Map<String, dynamic> toJson() => {
        "playerArmy": playerArmy.toJson(),
        "opponentArmy": opponentArmy.toJson(),
      };
}

class Army {
  Army({
    required this.listName,
    required this.points,
    required this.armyId,
    required this.units,
    required this.modifiers,
    required this.rules,
    required this.tags,
  });

  String listName;
  int points;
  String armyId;
  List<Unit> units;
  List<String> modifiers;
  List<String> rules;
  List<String> tags;

  factory Army.fromJson(Map<String, dynamic> json) => Army(
        listName: json["listName"],
        points: json["points"],
        armyId: json["armyId"],
        units: List<Unit>.from(json["units"].map((x) => Unit.fromJson(x))),
        modifiers: List<String>.from(json["modifiers"].map((x) => x)),
        rules: List<String>.from(json["rules"].map((x) => x)),
        tags: List<String>.from(json["tags"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "listName": listName,
        "points": points,
        "armyId": armyId,
        "units": List<dynamic>.from(units.map((x) => x.toJson())),
        "modifiers": List<dynamic>.from(modifiers.map((x) => x)),
        "rules": List<dynamic>.from(rules.map((x) => x)),
        "tags": List<dynamic>.from(tags.map((x) => x)),
      };
}
