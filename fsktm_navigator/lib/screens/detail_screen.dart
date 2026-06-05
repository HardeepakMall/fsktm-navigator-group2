import 'package:flutter/material.dart';
import '../models/location_model.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // This securely catches the data passed from the Search Bar or Block Screen
    final Location location =
        ModalRoute.of(context)!.settings.arguments as Location;

    return Scaffold(
      appBar: AppBar(
        title: Text(location.name, style: const TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF005B26),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Yihan will build the UI for:',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              location.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Text('Block: ${location.block} | Floor: ${location.floor}'),
          ],
        ),
      ),
    );
  }
}
