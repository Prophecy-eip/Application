import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../constant.dart';
import '../model/army.dart';

class GetArmiesService {
  Future<List<String>?> getArmies(String bearerToken) async {
    try {
      var url = Uri.parse(baseUrl + ArmyEndPoints.getArmies);
      var response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $bearerToken'},
      );
      if (response.statusCode == 200) {
        List<String> _armies =
            List<String>.from(json.decode(response.body).map((x) => x));
        return _armies;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

class GetNameService {
  Future<String?> getName(String bearerToken, String armyId) async {
    try {
      var url = Uri.parse(baseUrl + ArmyEndPoints.getName(armyId));
      var response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $bearerToken'},
      );
      if (response.statusCode == 200) {
        String _name = response.body;
        return _name;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
