import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../constant.dart';
import '../model/army.dart';
import '../model/unit.dart';

class GetArmiesService {
  Future<List<String>?> getArmies(String bearerToken) async {
    try {
      var url = Uri.parse(baseUrl + ArmyEndPoints.getArmies);
      var response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $bearerToken'},
      );
      if (response.statusCode == 200) {
        List<String> armies =
            List<String>.from(json.decode(response.body).map((x) => x));
        return armies;
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
        String name = response.body;
        return name;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

class GetOrganisationsService {
  Future<List<Organisation>?> getOrganisations(
      String bearerToken, String armyId) async {
    try {
      var url = Uri.parse(baseUrl + ArmyEndPoints.getOrganisations(armyId));
      var response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $bearerToken'},
      );
      if (response.statusCode == 200) {
        List<Organisation> model = organisationFromJson(response.body);
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

class GetUnitsService {
  Future<List<String>?> getUnits(String bearerToken, String armyId) async {
    try {
      var url = Uri.parse(baseUrl + ArmyEndPoints.getUnits(armyId));
      var response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $bearerToken'},
      );
      if (response.statusCode == 200) {
        List<String> units =
            List<String>.from(json.decode(response.body).map((x) => x));
        return units;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

class GetUnitService {
  Future<Unit?> getName(
      String bearerToken, String armyId, String unitId) async {
    try {
      var url = Uri.parse(baseUrl + ArmyEndPoints.getUnit(armyId, unitId));
      var response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $bearerToken'},
      );
      if (response.statusCode == 200) {
        Unit model = unitFromJson(response.body);
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

class GetUnitModifiersService {
  Future<List<String>?> getUnitModifiers(
      String bearerToken, String armyId, String unitId) async {
    try {
      var url =
          Uri.parse(baseUrl + ArmyEndPoints.getUnitModifiers(armyId, unitId));
      var response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $bearerToken'},
      );
      if (response.statusCode == 200) {
        List<String> modifiers =
            List<String>.from(json.decode(response.body).map((x) => x));
        return modifiers;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

class GetUnitModifierService {
  Future<Modifier?> getUnitModifier(String bearerToken, String armyId,
      String unitId, String modifierId) async {
    try {
      var url = Uri.parse(
          baseUrl + ArmyEndPoints.getUnitModifier(armyId, unitId, modifierId));
      var response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $bearerToken'},
      );
      if (response.statusCode == 200) {
        Modifier model = modifierFromJson(response.body);
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

class GetArmyModifiersService {
  Future<List<String>?> getUnitModifiers(
      String bearerToken, String armyId, String unitId) async {
    try {
      var url = Uri.parse(baseUrl + ArmyEndPoints.getArmyModifiers(armyId));
      var response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $bearerToken'},
      );
      if (response.statusCode == 200) {
        List<String> modifiers =
            List<String>.from(json.decode(response.body).map((x) => x));
        return modifiers;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

class GetArmyModifierService {
  Future<Modifier?> getArmyModifier(String bearerToken, String armyId,
      String unitId, String modifierId) async {
    try {
      var url = Uri.parse(
          baseUrl + ArmyEndPoints.getArmyModifier(armyId, modifierId));
      var response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $bearerToken'},
      );
      if (response.statusCode == 200) {
        Modifier model = modifierFromJson(response.body);
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

class GetRulesService {
  Future<List<String>?> getUnitModifiers(
      String bearerToken, String armyId) async {
    try {
      var url = Uri.parse(baseUrl + ArmyEndPoints.getRules(armyId));
      var response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $bearerToken'},
      );
      if (response.statusCode == 200) {
        List<String> rules =
            List<String>.from(json.decode(response.body).map((x) => x));
        return rules;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

class GetRuleService {
  Future<Rule?> getRule(
      String bearerToken, String armyId, String ruleId) async {
    try {
      var url = Uri.parse(baseUrl + ArmyEndPoints.getRule(armyId, ruleId));
      var response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $bearerToken'},
      );
      if (response.statusCode == 200) {
        Rule model = ruleFromJson(response.body);
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
