import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../models/floor.dart';

class BlockScreen extends StatefulWidget {
  const BlockScreen({super.key});

  @override
  State<BlockScreen> createState() => _BlockScreenState();
}

class _BlockScreenState extends State<BlockScreen> {
  List<Floor> floors = [];

  Future<void> loadFloors(String blockName) async {
    String path;

    if (blockName == 'Block A') {
      path = 'assets/json/blockA_data.json';
    } else if (blockName == 'Block B') {
      path = 'assets/json/blockB_data.json';
    } else {
      path = 'assets/json/blockC_data.json';
    }

    final jsonString = await rootBundle.loadString(path);
    final data = json.decode(jsonString);
    floors = (data['floors'] as List).map((e) => Floor.fromJson(e)).toList();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final blockName = ModalRoute.of(context)!.settings.arguments as String;
    if (floors.isEmpty) {
      loadFloors(blockName);
    }
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 16,
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
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
                    blockName,
                    style: const TextStyle(

                  const Text(
                    "Block A",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 193, 7),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Expanded(
                child: Expanded(
                  child: ListView.builder(
                    itemCount: floors.length,
                    itemBuilder: (context, index) {
                      final floor = floors[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: BlockCard(
                          title: floor.floorName,
                          imagePath: floor.symbol,
                          borderColor: Colors.white,
                          backgroundColor: Color(0xFFe9d7f7),
                          titleColor: Colors.black,
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              '/floor',
                              arguments: floor,
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BlockCard extends StatelessWidget {
  final String title;
  final String imagePath;
  final Color borderColor;
  final Color backgroundColor;
  final Color titleColor;
  final VoidCallback onTap;
  final double titleSize;

  const BlockCard({
    super.key,
    required this.title,
    required this.imagePath,
    required this.borderColor,
    required this.backgroundColor,
    required this.titleColor,
    required this.onTap,
    this.titleSize = 20,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      onTap: () {
        // Navigate to block details
      },

      borderRadius: BorderRadius.circular(20),

      child: Container(
        height: 170,

        padding: const EdgeInsets.all(16),

        decoration: BoxDecoration(
          color: backgroundColor,

          borderRadius: BorderRadius.circular(20),

          border: Border.all(
            color: borderColor,
            width: 1.5,
          ),
        ),

        child: Row(
          children: [
            // Image
            Container(
              width: 120,
              height: 120,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),

                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Text section
            Expanded(
              flex: 3,

              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 16,
                ),

                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(
                      title,

                      style: TextStyle(
                        fontSize: titleSize, // Customizable size
                        fontWeight: FontWeight.bold,
                        color: titleColor,
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Text(
                      "View rooms and facilities",
                      style: TextStyle(
                        fontSize: 16,
                        height: 1.5,
                        color: Colors.grey,

                      style: TextStyle(
                        fontSize: 12,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Arrow icon
            Expanded(
              flex: 1,

              child: Align(
                alignment: Alignment.topRight,

                child: Icon(
                  Icons.chevron_right,
                  size: 30,
                  color: const Color.fromARGB(255, 255, 193, 7),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}