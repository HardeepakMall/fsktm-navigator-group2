import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/locations_provider.dart';

class FacilityListScreen extends ConsumerWidget {
  const FacilityListScreen({super.key});

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
  Widget build(BuildContext context, WidgetRef ref) {
    final facilityType =
        ModalRoute.of(context)!.settings.arguments as String;

    // Get all locations from the shared provider and filter here
    final allLocations = ref.watch(locationsProvider).value ?? [];
    final facilities = allLocations.where((location) {
      return location.type.toLowerCase() == facilityType.toLowerCase();
    }).toList();

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