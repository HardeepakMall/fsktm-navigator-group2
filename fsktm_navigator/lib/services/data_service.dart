import 'dart:convert';
import 'package:flutter/services.dart';
import '../models/location_model.dart';

class DataService {
  static Future<List<Location>> loadLocations() async {
    try {
      final List<String> jsonFiles = [
        'assets/json/blockA_data.json',
        'assets/json/blockB_data.json',
        'assets/json/blockC_data.json',
      ];

      List<Location> allLocations = [];

      for (String file in jsonFiles) {
        final String jsonString = await rootBundle.loadString(file);
        final Map<String, dynamic> data = json.decode(jsonString);

        final List<dynamic> floors = data['floors'] ?? [];

        for (var floor in floors) {
          final List<dynamic> rooms = floor['rooms'] ?? [];

          for (var room in rooms) {
            allLocations.add(
              Location(
                id: room['name'] ?? '',
                name: room['name'] ?? '',
                type: room['type'] ?? '',
                floor: room['floor'] ?? floor['floorName'] ?? '',
                block: room['block'] ?? '',
                description: room['description'] ?? '',
                imagePath: room['imagePath'] ?? floor['image'] ?? '',
              ),
            );
          }
        }
      }

      return allLocations;
    } catch (e) {
      print("Error loading data: $e");
      return [];
    }
  }
}