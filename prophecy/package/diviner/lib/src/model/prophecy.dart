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
