import 'package:flutter/material.dart';
import '../models/floor.dart';
import '../models/location_model.dart';

class FloorScreen extends StatelessWidget {
  const FloorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final floor = ModalRoute.of(context)!.settings.arguments as Floor;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,

      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_back_ios_new),
                  ),

                  const SizedBox(width: 8),
                  Text(
                    floor.floorName,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2E5E3B),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  floor.image,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 24),

              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: floor.rooms.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.8,
                ),
                itemBuilder: (context, index) {
                  final room = floor.rooms[index];
                  return RoomCard(
                    title: room.name,
                    backgroundColor:
                        Theme.of(context).brightness == Brightness.light
                        ? Color(0xFFe8fac8)
                        : Theme.of(context).colorScheme.surfaceContainerHighest,
                    titleColor: Theme.of(context).colorScheme.onSurface,
                    onTap: () {
                       final location = Location(
                       id: room.name,
                       name: room.name,
                       type: room.type,
                       floor: room.floor.isNotEmpty ? room.floor : floor.floorName,
                       block: room.block,
                       description: room.description,
                       imagePath: room.imagePath.isNotEmpty ? room.imagePath : floor.image,
                       );
                      Navigator.pushNamed(
                        context,
                        '/details',
                        arguments: location,
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RoomCard extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  final Color titleColor;
  final VoidCallback onTap;

  const RoomCard({
    super.key,
    required this.title,
    required this.backgroundColor,
    required this.titleColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        height: double.infinity,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: titleColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
