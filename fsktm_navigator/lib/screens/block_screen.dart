import 'package:flutter/material.dart';

class BlockScreen extends StatelessWidget {
  const BlockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.arrow_back_ios_new),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    "Block A",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2E5E3B),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              Expanded(
                child: ListView(
                  children: [
                    BlockCard(
                      title: "Ground Floor",
                      imagePath: "assets/images/block_a.png",
                      borderColor: Colors.lightGreen,
                      backgroundColor: Colors.white,
                      titleColor: Colors.black,
                    ),

                    const SizedBox(height: 20),

                    BlockCard(
                      title: "First Floor",
                      imagePath: "assets/images/block_b.png",
                      borderColor: Colors.lightGreen,
                      backgroundColor: Colors.white,
                      titleColor: Colors.black,
                    ),

                    const SizedBox(height: 20),

                    BlockCard(
                      title: "Second Floor",
                      imagePath: "assets/images/block_c.png",
                      borderColor: Colors.lightGreen,
                      backgroundColor: Colors.white,
                      titleColor: Colors.black,
                    ),
                  ],
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

  const BlockCard({
    super.key,
    required this.title,
    required this.imagePath,
    required this.borderColor,
    required this.backgroundColor,
    required this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
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
          border: Border.all(color: borderColor, width: 1.5),
        ),
        child: Row(
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(16),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),

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
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: titleColor,
                      ),
                    ),

                    const SizedBox(height: 12),

                    const Text(
                      "View rooms and facilities",
                      style: TextStyle(fontSize: 16, height: 1.5),
                    ),
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
