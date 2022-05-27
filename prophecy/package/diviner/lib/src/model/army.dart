import 'dart:convert';

import 'unit.dart';

Army armyFromJson(String str) => Army.fromJson(json.decode(str));

String armyToJson(Army data) => json.encode(data.toJson());

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

Rule ruleFromJson(String str) => Rule.fromJson(json.decode(str));

String ruleToJson(Rule data) => json.encode(data.toJson());

class Rule {
  Rule({
    required this.category,
    required this.name,
    required this.description,
    required this.options,
  });

  String category;
  String name;
  String description;
  List<Option> options;

  factory Rule.fromJson(Map<String, dynamic> json) => Rule(
        category: json["category"],
        name: json["name"],
        description: json["description"],
        options:
            List<Option>.from(json["options"].map((x) => Option.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "category": category,
        "name": name,
        "description": description,
        "options": List<dynamic>.from(options.map((x) => x.toJson())),
      };
}

List<Organisation> organisationFromJson(String str) => List<Organisation>.from(
    json.decode(str).map((x) => Organisation.fromJson(x)));

String organisationToJson(List<Organisation> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Organisation {
  Organisation({
    required this.name,
    required this.limit,
  });

  String name;
  Limit limit;

  factory Organisation.fromJson(Map<String, dynamic> json) => Organisation(
        name: json["name"],
        limit: Limit.fromJson(json["limit"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "limit": limit.toJson(),
      };
}
