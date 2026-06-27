import 'package:flutter/material.dart';
import '../models/floor.dart';
import '../models/location_model.dart';

class FloorScreen extends StatelessWidget {
  const FloorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final floor = ModalRoute.of(context)!.settings.arguments as Floor;

    Color blockColor;

    switch (floor.rooms.first.block) {
      case 'Block A':
        blockColor = const Color.fromARGB(255, 255, 193, 7);
        break;
      case 'Block B':
        blockColor = const Color.fromARGB(255, 152, 36, 18);
        break;
      case 'Block C':
        blockColor = const Color.fromARGB(255, 62, 47, 230);
        break;
      default:
        blockColor = const Color(0xFF005B26);
    }

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
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: blockColor,
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
                  crossAxisCount: 2,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.6,
                ),
                itemBuilder: (context, index) {
                  final room = floor.rooms[index];

                  return RoomCard(
                    title: room.name,
                    backgroundColor:
                        Theme.of(context).brightness == Brightness.dark
                        ? Theme.of(context).cardColor
                        : Color.alphaBlend(
                            blockColor.withOpacity(0.09),
                            Colors.white,
                          ),
                    titleColor: blockColor,
                    borderColor: blockColor,
                    onTap: () {
                      final location = Location(
                        id: room.name,
                        name: room.name,
                        type: room.type,
                        floor: room.floor.isNotEmpty
                            ? room.floor
                            : floor.floorName,
                        block: room.block,
                        description: room.description,
                        imagePath: room.imagePath.isNotEmpty
                            ? room.imagePath
                            : floor.image,
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
  final Color borderColor;
  final VoidCallback onTap;

  const RoomCard({
    super.key,
    required this.title,
    required this.backgroundColor,
    required this.titleColor,
    required this.borderColor,
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
          border: Border.all(color: borderColor, width: 1.5),
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
