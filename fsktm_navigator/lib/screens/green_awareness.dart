import 'package:flutter/material.dart';

class GreenAwareness extends StatelessWidget {
  const GreenAwareness({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        backgroundColor: const Color(0xFF005B26),
        elevation: 0,
        foregroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: const Text(
          'Green Campus',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFEAF5E5),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Row(
                children: [
                  Expanded(
                    child: Text(
                      'Together We Build\na Sustainable\nCampus',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2E7D32),
                      ),
                    ),
                  ),
                  Icon(
                    Icons.public,
                    size: 75,
                    color: Color(0xFF43A047),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            const Text(
              'Green Tips',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2E7D32),
              ),
            ),

            const SizedBox(height: 12),

            greenTipCard(
              icon: Icons.phone_android_outlined,
              title: 'Paperless Navigation',
              description: 'Reduce paper usage through digital navigation.'
              '\nReduce paper maps and printed notices'
              '\nby using digital navigation.'
            ),

            greenTipCard(
              icon: Icons.recycling,
              title: 'Recycling Information',
              description: 'Recycle responsibly.'
              '\nSeparate recyclable waste and keep the campus clean.',
            ),

            greenTipCard(
              icon: Icons.lightbulb_outline,
              title: 'Save Energy',
              description: 'Small actions can reduce energy usage'
              '\nwithin the faculty.'
              '\nRemember to switch off lights'
              '\nand electrical devices when not in use.',
            ),

            greenTipCard(
              icon: Icons.water_drop_outlined,
              title: 'Save Water',
              description: 'Every drop matters.'
              '\nUse water wisely and report'
              '\nleaking taps or pipes.',
            ),

            greenTipCard(
              icon: Icons.directions_walk_outlined,
              title: 'Walk More, Drive Less',
              description: 'Walk whenever possible.'
              '\nReduce emissions by walking between'
              '\nnearby campus buildings.',
            ),

            const SizedBox(height: 16),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFFEAF5E5),
                borderRadius: BorderRadius.circular(16),
              ),
              child: const Row(
                children: [
                  Expanded(
                    child: Text(
                      '"Small steps today,\nbig impact tomorrow."',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF1B5E20),
                      ),
                    ),
                  ),
                  Icon(
                    Icons.eco,
                    size: 55,
                    color: Color(0xFF43A047),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget greenTipCard({
    required IconData icon,
    required String title,
    required String description,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: const Color(0xFFE0E0E0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: const Color(0xFF43A047),
            child: Icon(
              icon,
              color: Colors.white,
              size: 28,
            ),
          ),
          const SizedBox(width: 18),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2E7D32),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}