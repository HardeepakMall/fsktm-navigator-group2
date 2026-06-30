import 'package:flutter/material.dart';
import '../models/location_model.dart';
import '../services/data_service.dart';

class FacilityListScreen extends StatefulWidget {
  const FacilityListScreen({super.key});

  @override
  State<FacilityListScreen> createState() => _FacilityListScreenState();
}

class _FacilityListScreenState extends State<FacilityListScreen> {
  List<Location> facilities = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final facilityType = ModalRoute.of(context)!.settings.arguments as String;
    _loadFacilities(facilityType);
  }

  Future<void> _loadFacilities(String facilityType) async {
    final allLocations = await DataService.loadLocations();

    final results = allLocations.where((location) {
      return location.type.toLowerCase() == facilityType.toLowerCase();
    }).toList();

    setState(() {
      facilities = results;
    });
  }

  Color _getBlockColor(String block) {
    switch (block) {
      case 'Block A':
        return const Color.fromARGB(255, 183, 137, 0);
      case 'Block B':
        return const Color.fromARGB(255, 174, 32, 22);
      case 'Block C':
        return const Color.fromARGB(255, 62, 47, 230);
      default:
        return const Color(0xFF005B26);
    }
  }

  @override
  Widget build(BuildContext context) {
    final facilityType = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          facilityType,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 126, 6, 8),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: facilities.isEmpty
          ? const Center(
              child: Text('No facilities found.'),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: facilities.length,
              itemBuilder: (context, index) {
                final facility = facilities[index];
                final blockColor = _getBlockColor(facility.block);

                return Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Theme.of(context).cardColor
                      : Color.alphaBlend(
                          blockColor.withOpacity(0.09),
                          Colors.white,
                        ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(
                      color: blockColor,
                      width: 1.5,
                    ),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: blockColor,
                      child: Icon(
                        facilityType == 'Toilet' ? Icons.wc : Icons.mosque,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(
                      facility.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: blockColor,
                      ),
                    ),
                    subtitle: Text(
                      '${facility.block} • ${facility.floor}',
                    ),
                    trailing: Icon(
                      Icons.arrow_forward_ios,
                      size: 16,
                      color: blockColor,
                    ),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/details',
                        arguments: facility,
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}