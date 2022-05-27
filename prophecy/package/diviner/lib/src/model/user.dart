import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.username,
    required this.profilePicture,
  });

  String username;
  String profilePicture;

  factory User.fromJson(Map<String, dynamic> json) => User(
        username: json["username"],
        profilePicture: json["profilePicture"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "profilePicture": profilePicture,
      };
}
