import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../constant.dart';
import '../model/game.dart';

class CreateGameService {
  Future<String?> createGame(String bearerToken, Game game) async {
    try {
      var url = Uri.parse(baseUrl + GameEndPoints.createGame);
      var response = await http.post(url,
          headers: {'Authorization': 'Bearer $bearerToken'},
          body: game.toJson());
      if (response.statusCode == 201) {
        return response.body;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

class UpdateGameService {
  Future<int?> updateGame(String bearerToken, String gameId, Game game) async {
    try {
      var url = Uri.parse(baseUrl + GameEndPoints.updateGame(gameId));
      var response = await http.put(url,
          headers: {'Authorization': 'Bearer $bearerToken'},
          body: game.toJson());
      if (response.statusCode == 200) {
        return response.statusCode;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

class DeleteGameService {
  Future<int?> deleteGame(String bearerToken, String gameId) async {
    try {
      var url = Uri.parse(baseUrl + GameEndPoints.deleteGame(gameId));
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

class GetGamesService {
  Future<List<String>?> getGames(String bearerToken,
      {bool? win, String? listId, String? opponentId}) async {
    try {
      var query = (win == null
          ? (listId == null
              ? (opponentId == null ? '' : '?opponentId=$opponentId')
              : (opponentId == null
                  ? '?listId=$listId'
                  : '?listId=$listId+opponentId=$opponentId'))
          : (listId == null
              ? (opponentId == null
                  ? '?win=$win'
                  : '?win=$win+opponnentId=$opponentId')
              : (opponentId == null
                  ? '?win=$win+listId=$listId'
                  : '?win=$win+listId=$listId+opponentId=$opponentId')));
      var url = Uri.parse(baseUrl + GameEndPoints.getGames + query);
      var response = await http
          .get(url, headers: {'Authorization': 'Bearer $bearerToken'});
      if (response.statusCode == 200) {
        List<String> _games =
            List<String>.from(json.decode(response.body).map((x) => x));
        return _games;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

class GetGameService {
  Future<Game?> getGame(String bearerToken, String gameId) async {
    try {
      var url = Uri.parse(baseUrl + GameEndPoints.getGame(gameId));
      var response = await http
          .get(url, headers: {'Authorization': 'Bearer $bearerToken'});
      if (response.statusCode == 200) {
        Game _model = gameFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
