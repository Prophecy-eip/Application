import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:diviner/src/constant.dart';
import 'package:http/http.dart' as http;

import '../model/statistic.dart';

class CreateStatisticService {
  Future<String?> createStatistic(
      String bearerToken, Statistic statistic) async {
    try {
      var url = Uri.parse(baseUrl + StatisticEndPoints.createStatistic);
      var response = await http.post(url,
          headers: {'Authorization': 'Bearer $bearerToken'},
          body: statistic.toJson());
      if (response.statusCode == 201) {
        return response.body;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

class GetStatisticsService {
  Future<List<String>?> getStatistics(String bearerToken) async {
    try {
      var url = Uri.parse(baseUrl + StatisticEndPoints.getStatistics);
      var response = await http
          .post(url, headers: {'Authorization': 'Bearer $bearerToken'});
      if (response.statusCode == 200) {
        List<String> _statistics =
            List<String>.from(json.decode(response.body).map((x) => x));
        return _statistics;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

class GetStatisticService {
  Future<Statistic?> getStatistic(
      String bearerToken, String statisticId) async {
    try {
      var url =
          Uri.parse(baseUrl + StatisticEndPoints.getStatistic(statisticId));
      var response = await http
          .post(url, headers: {'Authorization': 'Bearer $bearerToken'});
      if (response.statusCode == 200) {
        Statistic _model = statisticFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

class DeleteStatisticService {
  Future<int?> deleteStatistic(String bearerToken, String statisticId) async {
    try {
      var url =
          Uri.parse(baseUrl + StatisticEndPoints.deleteStatistic(statisticId));
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
