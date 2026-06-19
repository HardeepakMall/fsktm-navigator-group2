import 'package:flutter/material.dart';

class GroundFloorScreen extends StatelessWidget {
  const GroundFloorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final blockName = ModalRoute.of(context)!.settings.arguments as String;
    final String imagePath = "assets/images/floor_plan_gfA.png";

    List<String> rooms;

    if (blockName == 'Block A') {
      rooms = [
        'Dewan Abdul Azim',
        'Foyer',
        'Postgraduate Laboratory 1',
        'Postgraduate Laboratory 2',
        'Postgrad Hub',
        'Putra Smart Classroom',
        'ICT Section',
      ];
    } else if (blockName == 'Block B') {
      rooms = [
        'Network Laboratory 1',
        'Network Laboratory 2',
        'High Performance Computing (HPC) Laboratory',
        'Forenics Laboratory',
        'Software Engineering Laboratory 1',
        'Embedded and Robotic Laboratory',
      ];
    } else {
      rooms = [
        'iSPACE',
        'Discussion Room',
        'C0-10',
        'C0-11',
        'C0-12',
        'C0-13',
        'C0-14 & C0-15 (Professor\'s Office 1)',
        'C0-16 & C0-17 (Professor\'s Office 2)',
        'C0-18 & C0-19 (Professor\'s Office 3)',
      ];
    }

    return Scaffold(
      backgroundColor: Colors.white,
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
                    "$blockName - Ground Floor",
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2E5E3B),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              const Text(
                "Floor Map",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 24),

              Container(
                width: 700,
                height: 500,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(height: 24),

              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: rooms.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  return RoomCard(
                    title: rooms[index],
                    borderColor: Colors.lightGreen,
                    backgroundColor: Colors.white,
                    titleColor: Colors.black,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/roomDetails',
                        arguments: {'block': blockName, 'room': rooms[index]},
                      );
                    },
                  );
                },
              ), // Add more classrooms or facilities as needed
            ],
          ),
        ),
      ),
    );
  }
}

class RoomCard extends StatelessWidget {
  final String title;
  final Color borderColor;
  final Color backgroundColor;
  final Color titleColor;
  final VoidCallback onTap;

  const RoomCard({
    super.key,
    required this.title,
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
        height: 90,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: borderColor, width: 1.5),
        ),
        child: Row(
          children: [
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
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: titleColor,
                      ),
                    ),

                    const SizedBox(height: 12),
                  ],
                ),
              ),
            ),

            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Icon(
                      Icons.chevron_right,
                      size: 30,
                      color: Colors.green[600],
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
