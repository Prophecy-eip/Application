import 'dart:convert';

UserCredentialsPayloadModel userCredentialsPayloadFromJson(String str) =>
    UserCredentialsPayloadModel.fromJson(json.decode(str));

String userCredentialsPayloadToJson(UserCredentialsPayloadModel data) =>
    json.encode(data.toJson());

class UserCredentialsPayloadModel {
  UserCredentialsPayloadModel({
    required this.username,
    required this.email,
    required this.password,
  });

  String username;
  String email;
  String password;

  factory UserCredentialsPayloadModel.fromJson(Map<String, dynamic> json) =>
      UserCredentialsPayloadModel(
        username: json["username"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
        "password": password,
      };
}
