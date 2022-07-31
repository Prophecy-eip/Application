import 'dart:convert';
import 'dart:developer';

import 'package:diviner/src/model/army.dart';
import 'package:http/http.dart' as http;

import '../constant.dart';
import '../model/army.dart';
import '../model/game.dart';
import '../model/post.dart';
import '../model/user.dart';

class GetUsersService {
  Future<List<String>?> getUsers(String bearerToken, String? username) async {
    try {
      var query = username == null ? '' : '?username=$username';
      var url = Uri.parse(baseUrl + UserEndPoints.getUsers + query);
      var response = await http
          .get(url, headers: {'Authorization': 'Bearer $bearerToken'});
      if (response.statusCode == 200) {
        List<String> users =
            List<String>.from(json.decode(response.body).map((x) => x));
        return users;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

class GetUserService {
  Future<User?> getUser(String bearerToken, String userId) async {
    try {
      var url = Uri.parse(baseUrl + UserEndPoints.getUser(userId));
      var response = await http
          .get(url, headers: {'Authorization': 'Bearer $bearerToken'});
      if (response.statusCode == 200) {
        User model = userFromJson(response.body);
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

class GetSharedGamesService {
  Future<List<String>?> getSharedGames(
      String bearerToken, String userId) async {
    try {
      var url = Uri.parse(baseUrl + UserEndPoints.getSharedGames(userId));
      var response = await http
          .get(url, headers: {'Authorization': 'Bearer $bearerToken'});
      if (response.statusCode == 200) {
        List<String> users =
            List<String>.from(json.decode(response.body).map((x) => x));
        return users;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

class GetSharedGameService {
  Future<Game?> getSharedGame(
      String bearerToken, String userId, String gameId) async {
    try {
      var url =
          Uri.parse(baseUrl + UserEndPoints.getSharedGame(userId, gameId));
      var response = await http
          .get(url, headers: {'Authorization': 'Bearer $bearerToken'});
      if (response.statusCode == 200) {
        Game model = gameFromJson(response.body);
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

class GetSharedListsService {
  Future<List<String>?> getSharedGames(
      String bearerToken, String userId) async {
    try {
      var url = Uri.parse(baseUrl + UserEndPoints.getSharedLists(userId));
      var response = await http
          .get(url, headers: {'Authorization': 'Bearer $bearerToken'});
      if (response.statusCode == 200) {
        List<String> lists =
            List<String>.from(json.decode(response.body).map((x) => x));
        return lists;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

class GetSharedListService {
  Future<Army?> getSharedGame(
      String bearerToken, String userId, String listId) async {
    try {
      var url =
          Uri.parse(baseUrl + UserEndPoints.getSharedList(userId, listId));
      var response = await http
          .get(url, headers: {'Authorization': 'Bearer $bearerToken'});
      if (response.statusCode == 200) {
        Army model = armyFromJson(response.body);
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

class GetPostsService {
  Future<List<String>?> getPosts(String bearerToken, String userId) async {
    try {
      var url = Uri.parse(baseUrl + UserEndPoints.getPosts(userId));
      var response = await http
          .get(url, headers: {'Authorization': 'Bearer $bearerToken'});
      if (response.statusCode == 200) {
        List<String> posts =
            List<String>.from(json.decode(response.body).map((x) => x));
        return posts;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

class GetPostPictureService {
  Future<Post?> getPostPicture(String bearerToken, String postId) async {
    try {
      var url = Uri.parse(baseUrl + UserEndPoints.getPostPicture(postId));
      var response = await http
          .get(url, headers: {'Authorization': 'Bearer $bearerToken'});
      if (response.statusCode == 200) {
        Post model = postFromJson(response.body);
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

class GetFollowersService {
  Future<List<String>?> getFollowers(String bearerToken, String userId) async {
    try {
      var url = Uri.parse(baseUrl + UserEndPoints.getFollowers(userId));
      var response = await http
          .get(url, headers: {'Authorization': 'Bearer $bearerToken'});
      if (response.statusCode == 200) {
        List<String> users =
            List<String>.from(json.decode(response.body).map((x) => x));
        return users;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

class GetFollowedUsersService {
  Future<List<String>?> getFollowedUsers(
      String bearerToken, String userId) async {
    try {
      var url = Uri.parse(baseUrl + UserEndPoints.getFollowedUsers(userId));
      var response = await http
          .get(url, headers: {'Authorization': 'Bearer $bearerToken'});
      if (response.statusCode == 200) {
        List<String> users =
            List<String>.from(json.decode(response.body).map((x) => x));
        return users;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
