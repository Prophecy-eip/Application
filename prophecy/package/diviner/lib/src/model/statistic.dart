import 'dart:convert';

Statistic statisticFromJson(String str) => Statistic.fromJson(json.decode(str));

String statisticToJson(Statistic data) => json.encode(data.toJson());

class Statistic {
  Statistic({
    required this.type,
    required this.option,
    required this.listId,
  });

  String type;
  String option;
  String listId;

  factory Statistic.fromJson(Map<String, dynamic> json) => Statistic(
        type: json["type"],
        option: json["option"],
        listId: json["listId"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "option": option,
        "listId": listId,
      };
}
