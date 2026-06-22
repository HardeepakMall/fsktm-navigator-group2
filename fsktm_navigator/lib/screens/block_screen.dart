import 'package:flutter/material.dart';

class BlockScreen extends StatelessWidget {
  const BlockScreen({super.key});

  @override
  Widget build(BuildContext context) {
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

              // Cards
              Expanded(
                child: ListView(
                  children: const [
                    BlockCard(
                      title: "Ground Floor",
                      imagePath: "assets/images/block_a.png",
                      borderColor: const Color.fromARGB(255, 255, 193, 7),
                      backgroundColor: Colors.white,
                      titleColor: Colors.black,
                      titleSize: 20, // Smaller text
                    ),

                    SizedBox(height: 20),

                    BlockCard(
                      title: "First Floor",
                      imagePath: "assets/images/block_b.png",
                      borderColor: const Color.fromARGB(255, 255, 193, 7),
                      backgroundColor: Colors.white,
                      titleColor: Colors.black,
                      titleSize: 20,
                    ),

                    SizedBox(height: 20),

                    BlockCard(
                      title: "Second Floor",
                      imagePath: "assets/images/block_c.png",
                      borderColor: Color.fromARGB(255, 229, 202, 0),
                      backgroundColor: Colors.white,
                      titleColor: Colors.black,
                      titleSize: 20,
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
  final double titleSize;

  const BlockCard({
    super.key,
    required this.title,
    required this.imagePath,
    required this.borderColor,
    required this.backgroundColor,
    required this.titleColor,
    this.titleSize = 20,
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
                color: Colors.grey[200],

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