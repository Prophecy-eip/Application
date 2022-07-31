import 'dart:convert';
import 'dart:developer';

import 'package:diviner/src/constant.dart';
import 'package:http/http.dart' as http;

import '../model/team.dart';

class CreateTeamService {
  Future<String?> createTeam(String bearerToken, Team team) async {
    try {
      var url = Uri.parse(baseUrl + TeamEndPoints.createTeam);
      var response = await http.post(url,
          headers: {'Authorization': 'Bearer $bearerToken'},
          body: team.toJson());
      if (response.statusCode == 201) {
        return response.body;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

class UpdateTeamService {
  Future<int?> updateTeam(String bearerToken, String teamId, Team team) async {
    try {
      var url = Uri.parse(baseUrl + TeamEndPoints.updateTeam(teamId));
      var response = await http.put(url,
          headers: {'Authorization': 'Bearer $bearerToken'},
          body: team.toJson());
      if (response.statusCode == 200) {
        return response.statusCode;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

class DeleteTeamService {
  Future<int?> deleteTeam(String bearerToken, String teamId) async {
    try {
      var url = Uri.parse(baseUrl + TeamEndPoints.deleteTeam(teamId));
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

class CreateMessageService {
  Future<String?> createMessage(
      String bearerToken, String teamId, Message message) async {
    try {
      var url = Uri.parse(baseUrl + TeamEndPoints.createMessage(teamId));
      var response = await http.put(url,
          headers: {'Authorization': 'Bearer $bearerToken'},
          body: message.toJson());
      if (response.statusCode == 201) {
        return response.body;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

class UpdateMessageService {
  Future<int?> updateMessage(String bearerToken, String teamId,
      String messageId, String message) async {
    try {
      var url =
          Uri.parse(baseUrl + TeamEndPoints.updateMessage(teamId, messageId));
      var response = await http.put(url,
          headers: {'Authorization': 'Bearer $bearerToken'}, body: message);
      if (response.statusCode == 200) {
        return response.statusCode;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

class DeleteMessageService {
  Future<int?> deleteMessage(
      String bearerToken, String teamId, String messageId) async {
    try {
      var url =
          Uri.parse(baseUrl + TeamEndPoints.deleteMessage(teamId, messageId));
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

class GetTeamsService {
  Future<List<String>?> getTeams(String bearerToken) async {
    try {
      var url = Uri.parse(baseUrl + TeamEndPoints.getTeams);
      var response = await http
          .get(url, headers: {'Authorization': 'Bearer $bearerToken'});
      if (response.statusCode == 200) {
        List<String> teams =
            List<String>.from(json.decode(response.body).map((x) => x));
        return teams;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

class GetTeamService {
  Future<Team?> getTeam(String bearerToken, String teamId) async {
    try {
      var url = Uri.parse(baseUrl + TeamEndPoints.getTeam(teamId));
      var response = await http
          .get(url, headers: {'Authorization': 'Bearer $bearerToken'});
      if (response.statusCode == 200) {
        Team model = teamFromJson(response.body);
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

class GetMessagesService {
  Future<List<Message>?> getMessages(
      String bearerToken, String teamId, int? number) async {
    try {
      var query = number == null ? '' : '?number=$number';
      var url = Uri.parse(baseUrl + TeamEndPoints.getMessages(teamId) + query);
      var response = await http
          .get(url, headers: {'Authorization': 'Bearer $bearerToken'});
      if (response.statusCode == 200) {
        List<Message> model = messagesFromJson(response.body);
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

class InviteUserService {
  Future<int?> inviteUser(
      String bearerToken, String teamId, String userId) async {
    try {
      var url = Uri.parse(baseUrl + TeamEndPoints.inviteUser(teamId, userId));
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

class RemoveUserService {
  Future<int?> removeUser(
      String bearerToken, String teamId, String userId) async {
    try {
      var url = Uri.parse(baseUrl + TeamEndPoints.removeUser(teamId, userId));
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

class RespondToInvitationService {
  Future<int?> respondToInvitation(
      String bearerToken, String teamId, bool invitationResponse) async {
    try {
      var url = Uri.parse(baseUrl + TeamEndPoints.respondToInvitation(teamId));
      var response = await http.put(url,
          headers: {'Authorization': 'Bearer $bearerToken'},
          body: invitationResponse);
      if (response.statusCode == 200) {
        return response.statusCode;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
