import 'dart:developer';

import 'package:diviner/constant.dart';
import 'package:http/http.dart' as http;

import '../model/response/account.dart';
import '../model/payload/account.dart';

class SignInService {
  Future<ServerCredentialsResponseModel?> signIn(
      UserCredentialsPayloadModel credentials) async {
    try {
      var url = Uri.parse(baseUrl + AccountEndPoints.signIn);
      var response = await http.post(url, body: credentials.toJson());
      if (response.statusCode == 200) {
        ServerCredentialsResponseModel _model =
            serverCredentialsModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

class SignUpService {
  Future<ServerCredentialsResponseModel?> signUp(
      UserCredentialsPayloadModel credentials) async {
    try {
      var url = Uri.parse(baseUrl + AccountEndPoints.signUp);
      var response = await http.post(url, body: credentials.toJson());
      if (response.statusCode == 200) {
        ServerCredentialsResponseModel _model =
            serverCredentialsModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

class SignOutService {
  Future<int?> signOut(String bearerToken) async {
    try {
      var url = Uri.parse(baseUrl + AccountEndPoints.signOut);
      var response =
          await http.post(url, headers: {'Authorization': bearerToken});
      if (response.statusCode == 200) {
        return response.statusCode;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
