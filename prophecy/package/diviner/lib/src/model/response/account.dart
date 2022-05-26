import 'dart:convert';

ServerCredentialsResponseModel serverCredentialsModelFromJson(String str) =>
    ServerCredentialsResponseModel.fromJson(json.decode(str));

String serverCredentialsModelToJson(ServerCredentialsResponseModel data) =>
    json.encode(data.toJson());

class ServerCredentialsResponseModel {
  ServerCredentialsResponseModel({
    required this.accessToken,
    required this.userId,
  });

  String accessToken;
  String userId;

  factory ServerCredentialsResponseModel.fromJson(Map<String, dynamic> json) =>
      ServerCredentialsResponseModel(
        accessToken: json["accessToken"],
        userId: json["userId"],
      );

  Map<String, dynamic> toJson() => {
        "accessToken": accessToken,
        "userId": userId,
      };
}
