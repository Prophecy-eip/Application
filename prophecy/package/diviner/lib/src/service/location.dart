import 'dart:convert';
import 'dart:developer';

import 'package:diviner/src/constant.dart';
import 'package:http/http.dart' as http;

import '../model/location.dart';

class CreateLocationService {
  Future<String?> createLocation(String bearerToken, Location location) async {
    try {
      var url = Uri.parse(baseUrl + LocationEndPoints.createLocation);
      var response = await http.post(url,
          headers: {'Authorization': 'Bearer $bearerToken'},
          body: location.toJson());
      if (response.statusCode == 201) {
        return response.body;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

class UpdateLocationService {
  Future<int?> updateLocation(
      String bearerToken, String locationId, Location location) async {
    try {
      var url =
          Uri.parse(baseUrl + LocationEndPoints.updateLocation(locationId));
      var response = await http.put(url,
          headers: {'Authorization': 'Bearer $bearerToken'},
          body: location.toJson());
      if (response.statusCode == 200) {
        return response.statusCode;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

class DeleteLocationService {
  Future<int?> deleteLocation(String bearerToken, String locationId) async {
    try {
      var url =
          Uri.parse(baseUrl + LocationEndPoints.deleteLocation(locationId));
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

class GetLocationsService {
  Future<List<String>?> getLocations(String bearerToken) async {
    try {
      var url = Uri.parse(baseUrl + LocationEndPoints.getLocations);
      var response = await http
          .get(url, headers: {'Authorization': 'Bearer $bearerToken'});
      if (response.statusCode == 200) {
        List<String> locations =
            List<String>.from(json.decode(response.body).map((x) => x));
        return locations;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

class GetLocationService {
  Future<Location?> getLocation(String bearerToken, String locationId) async {
    try {
      var url = Uri.parse(baseUrl + LocationEndPoints.getLocation(locationId));
      var response = await http
          .get(url, headers: {'Authorization': 'Bearer $bearerToken'});
      if (response.statusCode == 200) {
        Location model = locationFromJson(response.body);
        return model;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

class GetLocationEventsService {
  Future<List<String>?> getLocations(
      String bearerToken, String locationId) async {
    try {
      var url =
          Uri.parse(baseUrl + LocationEndPoints.getLocationEvents(locationId));
      var response = await http
          .get(url, headers: {'Authorization': 'Bearer $bearerToken'});
      if (response.statusCode == 200) {
        List<String> events =
            List<String>.from(json.decode(response.body).map((x) => x));
        return events;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
