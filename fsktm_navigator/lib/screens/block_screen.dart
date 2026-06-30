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
  bool _isLoaded = false;

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
    setState(() {
      floors = (data['floors'] as List).map((e) => Floor.fromJson(e)).toList();
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Load only once — didChangeDependencies is the right place to
    // access route arguments (not available in initState)
    if (!_isLoaded) {
      _isLoaded = true;
      final blockName =
          ModalRoute.of(context)!.settings.arguments as String;
      loadFloors(blockName);
    }
  }

  @override
  Widget build(BuildContext context) {
    final blockName = ModalRoute.of(context)!.settings.arguments as String;
    Color blockColor;

    switch (blockName) {
      case 'Block A':
        blockColor = const Color.fromARGB(255, 183, 137, 0);
        break;
      case 'Block B':
        blockColor = const Color.fromARGB(255, 174, 32, 22);
        break;
      case 'Block C':
        blockColor = const Color.fromARGB(255, 62, 47, 230);
        break;
      default:
        blockColor = const Color.fromARGB(255, 129, 0, 0);
    }

    // Show a loading indicator while data is being fetched
    if (floors.isEmpty) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(color: blockColor),
        ),
      );
    }
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
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
                blockName,
                style: TextStyle(
                 fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: blockColor,
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
                          borderColor: blockColor,
                          backgroundColor: Theme.of(context).brightness == Brightness.dark
                            ? Theme.of(context).cardColor
                          : Color.alphaBlend(
                          blockColor.withOpacity(0.09),
                          Colors.white,
                           ),
                           titleColor: blockColor,
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

  const BlockCard({
    super.key,
    required this.title,
    required this.imagePath,
    required this.borderColor,
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
        height: 130,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: borderColor, width: 1.5),
        ),
        child: Row(
          children: [
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.bold,
                        color: titleColor,
                      ),
                    ),

                    const SizedBox(height: 12),

                    const Text(
                      "View rooms and facilities",
                      style: TextStyle(
                        fontSize: 12,
                        height: 1.5,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Icon(
                      Icons.chevron_right,
                      size: 15,
                      color: borderColor,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
