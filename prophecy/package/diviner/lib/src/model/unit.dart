import 'dart:convert';

Unit unitFromJson(String str) => Unit.fromJson(json.decode(str));

String unitToJson(Unit data) => json.encode(data.toJson());

class Unit {
  Unit({
    required this.header,
    required this.characteristicProfiles,
    required this.modelRules,
    required this.options,
  });

  Header header;
  CharacteristicProfiles characteristicProfiles;
  ModelRules modelRules;
  List<Option> options;

  factory Unit.fromJson(Map<String, dynamic> json) => Unit(
        header: Header.fromJson(json["header"]),
        characteristicProfiles:
            CharacteristicProfiles.fromJson(json["characteristicProfiles"]),
        modelRules: ModelRules.fromJson(json["modelRules"]),
        options:
            List<Option>.from(json["options"].map((x) => Option.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "header": header.toJson(),
        "characteristicProfiles": characteristicProfiles.toJson(),
        "modelRules": modelRules.toJson(),
        "options": List<dynamic>.from(options.map((x) => x.toJson())),
      };
}

class Header {
  Header({
    required this.name,
    required this.armyCategories,
    required this.size,
    required this.cost,
    required this.scoring,
    required this.cap,
    required this.specifications,
    required this.required,
  });

  dynamic name;
  List<String> armyCategories;
  Cap size;
  dynamic cost;
  bool scoring;
  Cap cap;
  Specifications specifications;
  String required;

  factory Header.fromJson(Map<String, dynamic> json) => Header(
        name: json["name"],
        armyCategories: List<String>.from(json["armyCategories"].map((x) => x)),
        size: Cap.fromJson(json["size"]),
        cost: json["cost"],
        scoring: json["scoring"],
        cap: Cap.fromJson(json["cap"]),
        specifications: Specifications.fromJson(json["specifications"]),
        required: json["required"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "armyCategories": List<dynamic>.from(armyCategories.map((x) => x)),
        "size": size.toJson(),
        "cost": cost,
        "scoring": scoring,
        "cap": cap.toJson(),
        "specifications": specifications.toJson(),
        "required": required,
      };
}

class Cap {
  Cap({
    required this.min,
    required this.max,
  });

  int min;
  int max;

  factory Cap.fromJson(Map<String, dynamic> json) => Cap(
        min: json["min"],
        max: json["max"],
      );

  Map<String, dynamic> toJson() => {
        "min": min,
        "max": max,
      };
}

class Specifications {
  Specifications({
    required this.height,
    required this.type,
    required this.base,
  });

  String height;
  String type;
  Base base;

  factory Specifications.fromJson(Map<String, dynamic> json) => Specifications(
        height: json["height"],
        type: json["type"],
        base: Base.fromJson(json["base"]),
      );

  Map<String, dynamic> toJson() => {
        "height": height,
        "type": type,
        "base": base.toJson(),
      };
}

class Base {
  Base({
    required this.x,
    required this.y,
  });

  int x;
  int y;

  factory Base.fromJson(Map<String, dynamic> json) => Base(
        x: json["x"],
        y: json["y"],
      );

  Map<String, dynamic> toJson() => {
        "x": x,
        "y": y,
      };
}

class CharacteristicProfiles {
  CharacteristicProfiles({
    required this.global,
    required this.defensive,
    required this.offensive,
  });

  Global global;
  Defensive defensive;
  Offensive offensive;

  factory CharacteristicProfiles.fromJson(Map<String, dynamic> json) =>
      CharacteristicProfiles(
        global: Global.fromJson(json["global"]),
        defensive: Defensive.fromJson(json["defensive"]),
        offensive: Offensive.fromJson(json["offensive"]),
      );

  Map<String, dynamic> toJson() => {
        "global": global.toJson(),
        "defensive": defensive.toJson(),
        "offensive": offensive.toJson(),
      };
}

class Global {
  Global({
    required this.adv,
    required this.mar,
    required this.dis,
  });

  int adv;
  int mar;
  int dis;

  factory Global.fromJson(Map<String, dynamic> json) => Global(
        adv: json["adv"],
        mar: json["mar"],
        dis: json["dis"],
      );

  Map<String, dynamic> toJson() => {
        "adv": adv,
        "mar": mar,
        "dis": dis,
      };
}

class Defensive {
  Defensive({
    required this.hp,
    required this.def,
    required this.res,
    required this.arm,
    required this.argis,
  });

  String hp;
  String def;
  String res;
  String arm;
  String argis;

  factory Defensive.fromJson(Map<String, dynamic> json) => Defensive(
        hp: json["hp"],
        def: json["def"],
        res: json["res"],
        arm: json["arm"],
        argis: json["argis"],
      );

  Map<String, dynamic> toJson() => {
        "hp": hp,
        "def": def,
        "res": res,
        "arm": arm,
        "argis": argis,
      };
}

class Offensive {
  Offensive({
    required this.att,
    required this.off,
    required this.str,
    required this.ap,
    required this.agi,
  });

  String att;
  dynamic off;
  String str;
  String ap;
  String agi;

  factory Offensive.fromJson(Map<String, dynamic> json) => Offensive(
        att: json["att"],
        off: json["off"],
        str: json["str"],
        ap: json["ap"],
        agi: json["agi"],
      );

  Map<String, dynamic> toJson() => {
        "att": att,
        "off": off,
        "str": str,
        "ap": ap,
        "agi": agi,
      };
}

class ModelRules {
  ModelRules({
    required this.global,
    required this.defensive,
    required this.offensive,
  });

  List<String> global;
  List<String> defensive;
  List<String> offensive;

  factory ModelRules.fromJson(Map<String, dynamic> json) => ModelRules(
        global: List<String>.from(json["global"].map((x) => x)),
        defensive: List<String>.from(json["defensive"].map((x) => x)),
        offensive: List<String>.from(json["offensive"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "global": List<dynamic>.from(global.map((x) => x)),
        "defensive": List<dynamic>.from(defensive.map((x) => x)),
        "offensive": List<dynamic>.from(offensive.map((x) => x)),
      };
}

class Option {
  Option({
    required this.name,
    required this.description,
    required this.type,
    required this.category,
    required this.cost,
    required this.limit,
    required this.modelRestrictions,
    required this.effects,
  });

  String name;
  String description;
  String type;
  String category;
  int cost;
  Limit limit;
  List<String> modelRestrictions;
  Map<String, Effect> effects;

  factory Option.fromJson(Map<String, dynamic> json) => Option(
        name: json["name"],
        description: json["description"],
        type: json["type"],
        category: json["category"],
        cost: json["cost"],
        limit: Limit.fromJson(json["limit"]),
        modelRestrictions:
            List<String>.from(json["modelRestrictions"].map((x) => x)),
        effects: Map.from(json["effects"])
            .map((k, v) => MapEntry<String, Effect>(k, Effect.fromJson(v))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "type": type,
        "category": category,
        "cost": cost,
        "limit": limit.toJson(),
        "modelRestrictions":
            List<dynamic>.from(modelRestrictions.map((x) => x)),
        "effects": Map.from(effects)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
      };
}

class Limit {
  Limit({
    required this.type,
    required this.value,
  });

  String type;
  int value;

  factory Limit.fromJson(Map<String, dynamic> json) => Limit(
        type: json["type"],
        value: json["value"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "value": value,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap;
    return reverseMap;
  }
}

class Effect {
  Effect({
    required this.value,
    required this.duration,
    required this.range,
    required this.modelRestrictions,
    required this.conditions,
    required this.additionnalEffects,
  });

  int value;
  Duration duration;
  int range;
  List<ModelRestriction> modelRestrictions;
  List<Condition> conditions;
  List<AdditionnalEffect> additionnalEffects;

  factory Effect.fromJson(Map<String, dynamic> json) => Effect(
        value: json["value"],
        duration: durationValues.map[json["duration"]]!,
        range: json["range"],
        modelRestrictions: List<ModelRestriction>.from(json["modelRestrictions"]
            .map((x) => modelRestrictionValues.map[x])),
        conditions: List<Condition>.from(
            json["conditions"].map((x) => conditionValues.map[x])),
        additionnalEffects: List<AdditionnalEffect>.from(
            json["additionnalEffects"]
                .map((x) => additionnalEffectValues.map[x])),
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "duration": durationValues.reverse[duration],
        "range": range,
        "modelRestrictions": List<dynamic>.from(
            modelRestrictions.map((x) => modelRestrictionValues.reverse[x])),
        "conditions": List<dynamic>.from(
            conditions.map((x) => conditionValues.reverse[x])),
        "additionnalEffects": List<dynamic>.from(
            additionnalEffects.map((x) => additionnalEffectValues.reverse[x])),
      };
}

enum ModelRestriction { onFoot }

final modelRestrictionValues = EnumValues({"on foot": ModelRestriction.onFoot});

enum Condition { onFireWeakness }

final conditionValues =
    EnumValues({"on fire weakness": Condition.onFireWeakness});

enum AdditionnalEffect { rerollDices }

final additionnalEffectValues =
    EnumValues({"reroll dices": AdditionnalEffect.rerollDices});

enum Duration { once }

final durationValues = EnumValues({"Once": Duration.once});

Modifier modifierFromJson(String str) => Modifier.fromJson(json.decode(str));

String modifierToJson(Modifier data) => json.encode(data.toJson());

class Modifier {
  Modifier({
    required this.name,
    required this.description,
    required this.type,
    required this.category,
    required this.cost,
    required this.limit,
    required this.modelRestrictions,
    required this.effects,
  });

  String name;
  String description;
  String type;
  String category;
  int cost;
  Limit limit;
  List<String> modelRestrictions;
  Map<String, Effect> effects;

  factory Modifier.fromJson(Map<String, dynamic> json) => Modifier(
        name: json["name"],
        description: json["description"],
        type: json["type"],
        category: json["category"],
        cost: json["cost"],
        limit: Limit.fromJson(json["limit"]),
        modelRestrictions:
            List<String>.from(json["modelRestrictions"].map((x) => x)),
        effects: Map.from(json["effects"])
            .map((k, v) => MapEntry<String, Effect>(k, Effect.fromJson(v))),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "type": type,
        "category": category,
        "cost": cost,
        "limit": limit.toJson(),
        "modelRestrictions":
            List<dynamic>.from(modelRestrictions.map((x) => x)),
        "effects": Map.from(effects)
            .map((k, v) => MapEntry<String, dynamic>(k, v.toJson())),
      };
}
