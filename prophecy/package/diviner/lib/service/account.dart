import 'dart:developer';
import 'dart:io';

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
      var response = await http
          .post(url, headers: {'Authorization': 'Bearer $bearerToken'});
      if (response.statusCode == 200) {
        return response.statusCode;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

class UpdatePasswordService {
  Future<int?> updatePassword(String bearerToken, String password) async {
    try {
      var url = Uri.parse(baseUrl + AccountEndPoints.updatePassword);
      var response = await http.put(url,
          headers: {'Authorization': 'Bearer $bearerToken'}, body: password);
      if (response.statusCode == 200) {
        return response.statusCode;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

class UpdateUsernameService {
  Future<int?> updateUsername(String bearerToken, String username) async {
    try {
      var url = Uri.parse(baseUrl + AccountEndPoints.updateUsername);
      var response = await http.put(url,
          headers: {'Authorization': 'Bearer $bearerToken'}, body: username);
      if (response.statusCode == 200) {
        return response.statusCode;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

class UpdateEmailAddressService {
  Future<int?> updateEmailAddress(
      String bearerToken, String emailAddress) async {
    try {
      var url = Uri.parse(baseUrl + AccountEndPoints.updateEmailAddress);
      var response = await http.put(url,
          headers: {'Authorization': 'Bearer $bearerToken'},
          body: emailAddress);
      if (response.statusCode == 200) {
        return response.statusCode;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

class DeleteAccountService {
  Future<int?> deleteAccount(String bearerToken) async {
    try {
      var url = Uri.parse(baseUrl + AccountEndPoints.deleteAccount);
      var response = await http
          .delete(url, headers: {'Authorization': 'Bearer $bearerToken'});
      if (response.statusCode == 200) {
        return response.statusCode;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

class UpdatePictureService {
  Future<int?> updatePicture(String bearerToken, File picture) async {
    try {
      var url = Uri.parse(baseUrl + AccountEndPoints.updatePicture);
      var response = await http.put(url,
          headers: {'Authorization': 'Bearer $bearerToken'}, body: picture);
      if (response.statusCode == 200) {
        return response.statusCode;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
