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

PostPayloadModel postPayloadModelFromJson(String str) =>
    PostPayloadModel.fromJson(json.decode(str));

String postPayloadModelToJson(PostPayloadModel data) =>
    json.encode(data.toJson());

class PostPayloadModel {
  PostPayloadModel({
    required this.description,
    required this.pictures,
  });

  String description;
  List<String> pictures;

  factory PostPayloadModel.fromJson(Map<String, dynamic> json) =>
      PostPayloadModel(
        description: json["description"],
        pictures: List<String>.from(json["pictures"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "description": description,
        "pictures": List<dynamic>.from(pictures.map((x) => x)),
      };
}
