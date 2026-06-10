import 'package:flutter/material.dart';

class GreenAwareness extends StatelessWidget {
  const GreenAwareness({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    final backgroundColor = Theme.of(context).scaffoldBackgroundColor;
    final cardColor = Theme.of(context).cardColor;
    final textColor = Theme.of(context).textTheme.bodyMedium?.color;
    final greenBoxColor =
        isDark ? const Color(0xFF143D25) : const Color(0xFFEAF5E5);
    final borderColor =
        isDark ? const Color(0xFF2E5B3D) : const Color(0xFFE0E0E0);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: const Color(0xFF005B26),
        elevation: 0,
        foregroundColor: Colors.white,
        title: const Text(
          'Green Campus',
          style: TextStyle(fontWeight: FontWeight.bold),
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
                color: greenBoxColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      'Together We Build\na Sustainable\nCampus',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF43A047),
                      ),
                    ),
                  ),
                  Icon(
                    Icons.public,
                    size: 75,
                    color: isDark
                        ? const Color(0xFF81C784)
                        : const Color(0xFF005B26),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            Text(
              'Green Tips',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: isDark
                    ? const Color(0xFF81C784)
                    : const Color(0xFF005B26),
              ),
            ),

            const SizedBox(height: 12),

            greenTipCard(
              context: context,
              icon: Icons.phone_android_outlined,
              title: 'Paperless Navigation',
              description: 'Reduce paper maps and printed notices\nby using digital navigation.',
              cardColor: cardColor,
              borderColor: borderColor,
              textColor: textColor,
            ),

            greenTipCard(
              context: context,
              icon: Icons.recycling,
              title: 'Recycling Information',
              description: 'Recycle responsibly.\nSeparate recyclable waste and keep the campus clean.',
              cardColor: cardColor,
              borderColor: borderColor,
              textColor: textColor,
            ),

            greenTipCard(
              context: context,
              icon: Icons.lightbulb_outline,
              title: 'Save Energy',
              description: 'Switch off lights and electrical devices\nwhen not in use.',
              cardColor: cardColor,
              borderColor: borderColor,
              textColor: textColor,
            ),

            greenTipCard(
              context: context,
              icon: Icons.water_drop_outlined,
              title: 'Save Water',
              description: 'Use water wisely and report\nleaking taps or pipes.',
              cardColor: cardColor,
              borderColor: borderColor,
              textColor: textColor,
            ),

            greenTipCard(
              context: context,
              icon: Icons.directions_walk_outlined,
              title: 'Walk More, Drive Less',
              description: 'Reduce emissions by walking between\nnearby campus buildings.',
              cardColor: cardColor,
              borderColor: borderColor,
              textColor: textColor,
            ),

            const SizedBox(height: 16),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: greenBoxColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: Text(
                      '"Small steps today,\nbig impact tomorrow."',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF43A047),
                      ),
                    ),
                  ),
                  Icon(
                    Icons.eco,
                    size: 55,
                    color: isDark
                        ? const Color(0xFF81C784)
                        : const Color(0xFF005B26),
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
    required BuildContext context,
    required IconData icon,
    required String title,
    required String description,
    required Color cardColor,
    required Color borderColor,
    required Color? textColor,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: borderColor),
        boxShadow: [
          if (!isDark)
            BoxShadow(
              color: Colors.black.withOpacity(0.04),
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
        ],
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 28,
            backgroundColor: Color(0xFF43A047),
            child: Icon(
              Icons.eco,
              color: Colors.white,
              size: 28,
            ),
          ),
          const SizedBox(width: 18),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: isDark
                        ? const Color(0xFF81C784)
                        : const Color(0xFF005B26),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 14,
                    color: textColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}