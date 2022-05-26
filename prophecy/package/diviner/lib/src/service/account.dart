import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../constant.dart';
import '../model/account.dart';

class SignInService {
  Future<ServerCredentials?> signIn(UserCredentials credentials) async {
    try {
      var url = Uri.parse(baseUrl + AccountEndPoints.signIn);
      var response = await http.post(url, body: credentials.toJson());
      if (response.statusCode == 200) {
        ServerCredentials _model = serverCredentialsFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

class SignUpService {
  Future<ServerCredentials?> signUp(UserCredentials credentials) async {
    try {
      var url = Uri.parse(baseUrl + AccountEndPoints.signUp);
      var response = await http.post(url, body: credentials.toJson());
      if (response.statusCode == 201) {
        ServerCredentials _model = serverCredentialsFromJson(response.body);
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

class ShareListService {
  Future<int?> shareList(String bearerToken, String listId) async {
    try {
      var url = Uri.parse(baseUrl + AccountEndPoints.shareList(listId));
      var response = await http
          .put(url, headers: {'Authorization': 'Bearer $bearerToken'});
      if (response.statusCode == 200) {
        return response.statusCode;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

class UnshareListService {
  Future<int?> unshareList(String bearerToken, String listId) async {
    try {
      var url = Uri.parse(baseUrl + AccountEndPoints.unshareList(listId));
      var response = await http
          .put(url, headers: {'Authorization': 'Bearer $bearerToken'});
      if (response.statusCode == 200) {
        return response.statusCode;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

class ShareGameService {
  Future<int?> shareGame(String bearerToken, String gameId) async {
    try {
      var url = Uri.parse(baseUrl + AccountEndPoints.shareGame(gameId));
      var response = await http
          .put(url, headers: {'Authorization': 'Bearer $bearerToken'});
      if (response.statusCode == 200) {
        return response.statusCode;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

class UnshareGameService {
  Future<int?> unshareGame(String bearerToken, String gameId) async {
    try {
      var url = Uri.parse(baseUrl + AccountEndPoints.unshareGame(gameId));
      var response = await http
          .put(url, headers: {'Authorization': 'Bearer $bearerToken'});
      if (response.statusCode == 200) {
        return response.statusCode;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

class ShareStatisticService {
  Future<int?> shareStatistic(String bearerToken, String statisticId) async {
    try {
      var url =
          Uri.parse(baseUrl + AccountEndPoints.shareStatistic(statisticId));
      var response = await http
          .put(url, headers: {'Authorization': 'Bearer $bearerToken'});
      if (response.statusCode == 200) {
        return response.statusCode;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

class UnshareStatisticService {
  Future<int?> unshareStatistic(String bearerToken, String statisticId) async {
    try {
      var url =
          Uri.parse(baseUrl + AccountEndPoints.unshareStatistic(statisticId));
      var response = await http
          .put(url, headers: {'Authorization': 'Bearer $bearerToken'});
      if (response.statusCode == 200) {
        return response.statusCode;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

class CreatePostService {
  Future<String?> createPost(String bearerToken, Post post) async {
    try {
      var url = Uri.parse(baseUrl + AccountEndPoints.createPost);
      var response = await http.post(url,
          headers: {'Authorization': 'Bearer $bearerToken'},
          body: post.toJson());
      if (response.statusCode == 201) {
        String _model = response.body;
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

class UpdatePostService {
  Future<int?> updatePost(String bearerToken, String postId, Post post) async {
    try {
      var url = Uri.parse(baseUrl + AccountEndPoints.updatePost(postId));
      var response = await http.put(url,
          headers: {'Authorization': 'Bearer $bearerToken'},
          body: post.toJson());
      if (response.statusCode == 200) {
        return response.statusCode;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

class DeletePostService {
  Future<int?> deletePost(String bearerToken, String postId) async {
    try {
      var url = Uri.parse(baseUrl + AccountEndPoints.deletePost(postId));
      var response = await http
          .put(url, headers: {'Authorization': 'Bearer $bearerToken'});
      if (response.statusCode == 200) {
        return response.statusCode;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

class FollowUserService {
  Future<int?> followUser(String bearerToken, String userId) async {
    try {
      var url = Uri.parse(baseUrl + AccountEndPoints.followUser(userId));
      var response = await http
          .put(url, headers: {'Authorization': 'Bearer $bearerToken'});
      if (response.statusCode == 200) {
        return response.statusCode;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

class UnfollowUserService {
  Future<int?> unfollowUser(String bearerToken, String userId) async {
    try {
      var url = Uri.parse(baseUrl + AccountEndPoints.unfollowUser(userId));
      var response = await http
          .put(url, headers: {'Authorization': 'Bearer $bearerToken'});
      if (response.statusCode == 200) {
        return response.statusCode;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

class BlockUserService {
  Future<int?> blockUser(String bearerToken, String userId) async {
    try {
      var url = Uri.parse(baseUrl + AccountEndPoints.blockUser(userId));
      var response = await http
          .put(url, headers: {'Authorization': 'Bearer $bearerToken'});
      if (response.statusCode == 200) {
        return response.statusCode;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

class UnblockUserService {
  Future<int?> unblockUser(String bearerToken, String userId) async {
    try {
      var url = Uri.parse(baseUrl + AccountEndPoints.unblockUser(userId));
      var response = await http
          .put(url, headers: {'Authorization': 'Bearer $bearerToken'});
      if (response.statusCode == 200) {
        return response.statusCode;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

class GetBlockedUsersService {
  Future<List<String>?> getBlockedUser(
      String bearerToken, String userId) async {
    try {
      var url = Uri.parse(baseUrl + AccountEndPoints.getBlockedUser(userId));
      var response = await http
          .put(url, headers: {'Authorization': 'Bearer $bearerToken'});
      if (response.statusCode == 200) {
        List<String> _users =
            List<String>.from(json.decode(response.body).map((x) => x));
        return _users;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
