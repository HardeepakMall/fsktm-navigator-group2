import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/location_model.dart';

class DataService {
  // This function reads the local JSON file and turns it into a List of Location objects
  static Future<List<Location>> loadLocations() async {
    try {
      final String jsonString = await rootBundle.loadString(
        'assets/json/fsktm_locations.json',
      );
      final List<dynamic> jsonList = json.decode(jsonString);

      return jsonList.map((json) => Location.fromJson(json)).toList();
    } catch (e) {
      print("Error loading data: $e");
      return [];
    }
  }
}
