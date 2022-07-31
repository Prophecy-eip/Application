import 'dart:developer';

import 'package:http/http.dart' as http;

import '../constant.dart';
import '../model/prophecy.dart';

class GetProphecyService {
  Future<Prophecy?> getProphecy(String bearerToken) async {
    try {
      var url = Uri.parse(baseUrl + ProphecyEndPoints.getProphecy);
      var response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $bearerToken'},
      );
      if (response.statusCode == 200) {
        Prophecy model = prophecyFromJson(response.body);
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

class GetHistoryService {
  Future<List<Prophecy>?> getHistory(String bearerToken) async {
    try {
      var url = Uri.parse(baseUrl + ProphecyEndPoints.getHistory);
      var response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $bearerToken'},
      );
      if (response.statusCode == 200) {
        List<Prophecy> model = prophecyHistoryFromJson(response.body);
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
