import 'dart:convert';
import 'dart:developer';

import 'package:diviner/src/constant.dart';
import 'package:http/http.dart' as http;

import '../model/army.dart';

class CreateListService {
  Future<String?> createTeam(String bearerToken, Army army) async {
    try {
      var url = Uri.parse(baseUrl + ArmyListEndPoints.createList);
      var response = await http.post(url,
          headers: {'Authorization': 'Bearer $bearerToken'},
          body: army.toJson());
      if (response.statusCode == 201) {
        return response.body;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

class UpdateListService {
  Future<int?> updateList(String bearerToken, String listId, Army army) async {
    try {
      var url = Uri.parse(baseUrl + ArmyListEndPoints.updateList(listId));
      var response = await http.put(url,
          headers: {'Authorization': 'Bearer $bearerToken'},
          body: army.toJson());
      if (response.statusCode == 200) {
        return response.statusCode;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

class DeleteListService {
  Future<int?> deleteList(String bearerToken, String listId) async {
    try {
      var url = Uri.parse(baseUrl + ArmyListEndPoints.deleteList(listId));
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

class GetListsService {
  Future<List<String>?> getLists(String bearerToken, String? tagId) async {
    try {
      var query = tagId == null ? '' : '?tagId=$tagId';
      var url = Uri.parse(baseUrl + ArmyListEndPoints.getLists + query);
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

class GetListService {
  Future<Army?> getList(String bearerToken, String listId) async {
    try {
      var url = Uri.parse(baseUrl + ArmyListEndPoints.getList(listId));
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

class CreateTagService {
  Future<String?> createTag(String bearerToken, Tag tag) async {
    try {
      var url = Uri.parse(baseUrl + ArmyListEndPoints.createTag);
      var response = await http.post(url,
          headers: {'Authorization': 'Bearer $bearerToken'},
          body: tag.toJson());
      if (response.statusCode == 201) {
        return response.body;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

class UpdateTagService {
  Future<int?> updateList(String bearerToken, String tagId, Tag tag) async {
    try {
      var url = Uri.parse(baseUrl + ArmyListEndPoints.updateTag(tagId));
      var response = await http.put(url,
          headers: {'Authorization': 'Bearer $bearerToken'},
          body: tag.toJson());
      if (response.statusCode == 200) {
        return response.statusCode;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

class DeleteTagService {
  Future<int?> deleteTag(String bearerToken, String tagId) async {
    try {
      var url = Uri.parse(baseUrl + ArmyListEndPoints.deleteTag(tagId));
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

class GetTagsService {
  Future<List<String>?> getTags(String bearerToken) async {
    try {
      var url = Uri.parse(baseUrl + ArmyListEndPoints.getTags);
      var response = await http
          .get(url, headers: {'Authorization': 'Bearer $bearerToken'});
      if (response.statusCode == 200) {
        List<String> tags =
            List<String>.from(json.decode(response.body).map((x) => x));
        return tags;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

class GetTagService {
  Future<Tag?> getTag(String bearerToken, String tagId) async {
    try {
      var url = Uri.parse(baseUrl + ArmyListEndPoints.getTag(tagId));
      var response = await http
          .get(url, headers: {'Authorization': 'Bearer $bearerToken'});
      if (response.statusCode == 200) {
        Tag model = tagFromJson(response.body);
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
