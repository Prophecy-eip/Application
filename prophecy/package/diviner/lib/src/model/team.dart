import 'dart:convert';

Team teamFromJson(String str) => Team.fromJson(json.decode(str));

String teamToJson(Team data) => json.encode(data.toJson());

class Team {
  Team({
    required this.name,
    required this.description,
    required this.ownerId,
    required this.messages,
    required this.members,
  });

  String name;
  String description;
  String ownerId;
  List<Message> messages;
  List<String> members;

  factory Team.fromJson(Map<String, dynamic> json) => Team(
        name: json["name"],
        description: json["description"],
        ownerId: json["ownerId"],
        messages: List<Message>.from(
            json["messages"].map((x) => Message.fromJson(x))),
        members: List<String>.from(json["members"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "ownerId": ownerId,
        "messages": List<dynamic>.from(messages.map((x) => x.toJson())),
        "members": List<dynamic>.from(members.map((x) => x)),
      };
}

List<Message> messagesFromJson(String str) =>
    List<Message>.from(json.decode(str).map((x) => Message.fromJson(x)));

String messagesToJson(List<Message> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Message {
  Message({
    required this.authorId,
    required this.message,
    required this.dateTime,
  });

  String authorId;
  String message;
  String dateTime;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
        authorId: json["authorId"],
        message: json["message"],
        dateTime: json["dateTime"],
      );

  Map<String, dynamic> toJson() => {
        "authorId": authorId,
        "message": message,
        "dateTime": dateTime,
      };
}
