import 'package:flutter/material.dart';
import '../models/location_model.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Location location =
        ModalRoute.of(context)!.settings.arguments as Location;

    Color blockColor;

    switch (location.block) {
      case 'Block A':
        blockColor = const Color.fromARGB(255, 255, 193, 7);
        break;
      case 'Block B':
        blockColor = const Color.fromARGB(255, 174, 32, 22);
        break;
      case 'Block C':
        blockColor = const Color.fromARGB(255, 62, 47, 230);
        break;
      default:
        blockColor = const Color(0xFF005B26);
    }

    final textColor = Theme.of(context).textTheme.bodyMedium?.color;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          location.name,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: blockColor,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildImage(context, location.imagePath),

            const SizedBox(height: 20),

            Text(
              location.name,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: blockColor,
              ),
            ),

            const SizedBox(height: 6),

            Text(
              location.type,
              style: TextStyle(
                fontSize: 16,
                color: textColor,
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 20),

            _infoCard(
              context,
              Icons.apartment,
              'Block',
              location.block,
              blockColor,
            ),

            _infoCard(
              context,
              Icons.layers,
              'Floor',
              location.floor,
              blockColor,
            ),

            _infoCard(
              context,
              Icons.category,
              'Type',
              location.type,
              blockColor,
            ),

            const SizedBox(height: 20),

            Text(
              'Description',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: blockColor,
              ),
            ),

            const SizedBox(height: 8),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: _cardDecoration(context, blockColor),
              child: Text(
                location.description.isNotEmpty
                    ? location.description
                    : 'No description available yet.',
                style: TextStyle(
                  fontSize: 15,
                  height: 1.5,
                  color: textColor,
                ),
              ),
            ),

            const SizedBox(height: 20),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: _cardDecoration(context, blockColor),
              child: Row(
                children: [
                  Icon(
                    Icons.eco,
                    color: blockColor,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'This digital detail page supports paperless navigation and reduces the need for printed faculty maps.',
                      style: TextStyle(
                        fontSize: 14,
                        color: textColor,
                        fontWeight: FontWeight.w500,
                      ),
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

   Widget _buildImage(BuildContext context, String imagePath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.asset(
        imagePath,
        height: 210,
        width: double.infinity,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            height: 210,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).cardColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.image_not_supported_outlined,
                  size: 60,
                  color: Color(0xFF2E7D32),
                ),
                SizedBox(height: 8),
                Text(
                  'Image not available',
                  style: TextStyle(
                    color: Color(0xFF2E7D32),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _infoCard(
    BuildContext context,
    IconData icon,
    String title,
    String value,
    Color blockColor,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(14),
      decoration: _cardDecoration(context, blockColor),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: blockColor,
            child: Icon(
              icon,
              color: Colors.white,
              size: 22,
            ),
          ),

          const SizedBox(width: 14),

          Text(
            '$title: ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: blockColor,
            ),
          ),

          Expanded(
            child: Text(
              value.isNotEmpty ? value : 'Not specified',
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyMedium?.color,
              ),
            ),
          ),
        ],
      ),
    );
  }

  BoxDecoration _cardDecoration(BuildContext context, Color blockColor) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return BoxDecoration(
      color: isDark
          ? Theme.of(context).cardColor
          : Color.alphaBlend(
              blockColor.withOpacity(0.09),
              Colors.white,
            ),
      borderRadius: BorderRadius.circular(14),
      border: Border.all(
        color: blockColor.withOpacity(0.7),
      ),
      boxShadow: [
        if (!isDark)
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
      ],
    );
  }
}