import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;

import '../constant.dart';
import '../model/event.dart';

class CreateEventService {
  Future<String?> createEvent(String bearerToken, Event event) async {
    try {
      var url = Uri.parse(baseUrl + EventEndPoints.createEvent);
      var response = await http.post(url,
          headers: {'Authorization': 'Bearer $bearerToken'},
          body: event.toJson());
      if (response.statusCode == 201) {
        return response.body;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}

class SaveEventService {
  Future<int?> saveEvent(String bearerToken, String eventId) async {
    try {
      var url = Uri.parse(baseUrl + EventEndPoints.saveEvent + eventId);
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

class GetEventsService {
  Future<List<String>?> getEvents(String bearerToken,
      {String city = '', String locationId = ''}) async {
    try {
      var query = city.isEmpty
          ? (locationId.isEmpty ? '' : '?locationId=$locationId')
          : (locationId.isEmpty
              ? '?city=$city'
              : '?city=$city&locationId=$locationId');
      var url = Uri.parse(baseUrl + EventEndPoints.getEvents + query);
      var response = await http.get(
        url,
        headers: {'Authorization': 'Bearer $bearerToken'},
      );
      if (response.statusCode == 200) {
        List<String> _events =
            List<String>.from(json.decode(response.body).map((x) => x));
        return _events;
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }
}
