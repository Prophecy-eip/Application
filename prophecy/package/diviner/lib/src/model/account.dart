import 'dart:convert';

UserCredentials userCredentialsFromJson(String str) =>
    UserCredentials.fromJson(json.decode(str));

String userCredentialsToJson(UserCredentials data) =>
    json.encode(data.toJson());

class UserCredentials {
  UserCredentials({
    required this.username,
    required this.email,
    required this.password,
  });

  String username;
  String email;
  String password;

  factory UserCredentials.fromJson(Map<String, dynamic> json) =>
      UserCredentials(
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

ServerCredentials serverCredentialsFromJson(String str) =>
    ServerCredentials.fromJson(json.decode(str));

String serverCredentialsToJson(ServerCredentials data) =>
    json.encode(data.toJson());

class ServerCredentials {
  ServerCredentials({
    required this.accessToken,
    required this.userId,
  });

  String accessToken;
  String userId;

  factory ServerCredentials.fromJson(Map<String, dynamic> json) =>
      ServerCredentials(
        accessToken: json["accessToken"],
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "userId": userId,
      };
}
