import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FSKTM Navigator'),
        backgroundColor: const Color(0xFF005B26), // UPM Green
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search Bar Placeholder
            TextField(
              decoration: InputDecoration(
                hintText: 'Search room, lab, facility...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: (value) {
                // TODO: Implement search logic here
              },
            ),
            const SizedBox(height: 20),

            // Faculty Overview Image Placeholder
            Container(
              height: 150,
              color: Colors.grey[300],
              child: const Center(child: Text("Faculty Overview Map")),
            ),
            const SizedBox(height: 20),

            // Block Selection Grid
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: [
                // FIXED: lowercase 'context'
                _buildBlockButton(context, "Block A"),
                _buildBlockButton(context, "Block B"),
                _buildBlockButton(context, "Block C"),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // FIXED: Capital 'W' for Widget
  Widget _buildBlockButton(BuildContext context, String title) {
    return Card(
      child: InkWell(
        onTap: () {
          /* Navigate to block details */
        },
        child: Center(child: Text(title)),
      ),
    );
  }
}
