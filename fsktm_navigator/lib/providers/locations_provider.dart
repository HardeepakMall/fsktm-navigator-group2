import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/location_model.dart';
import '../services/data_service.dart';

final locationsProvider = FutureProvider<List<Location>>((ref) async {
  return DataService.loadLocations();
});
