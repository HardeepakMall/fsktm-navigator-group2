import 'package:flutter/material.dart';
import '../models/location_model.dart';
import '../services/data_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Location> allLocations = [];
  List<Location> filteredLocations = [];
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  // Load the data when the screen initializes
  Future<void> _loadData() async {
    final locations = await DataService.loadLocations();
    setState(() {
      allLocations = locations;
    });
  }

  // Filter logic for the search bar
  void _runSearch(String enteredKeyword) {
    List<Location> results = [];
    if (enteredKeyword.isEmpty) {
      results = []; // Show nothing if search is empty
    } else {
      results = allLocations
          .where(
            (location) =>
                location.name.toLowerCase().contains(
                  enteredKeyword.toLowerCase(),
                ) ||
                location.id.toLowerCase().contains(
                  enteredKeyword.toLowerCase(),
                ),
          )
          .toList();
    }

    setState(() {
      filteredLocations = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'FSKTM Navigator',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF005B26), // UPM Green
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Functional Search Bar
            TextField(
              controller: searchController,
              onChanged: (value) => _runSearch(value),
              decoration: InputDecoration(
                hintText: 'Search room, lab, facility...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () {
                          searchController.clear();
                          _runSearch('');
                        },
                      )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Display Search Results dynamically
            if (filteredLocations.isNotEmpty)
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: filteredLocations.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      title: Text(filteredLocations[index].name),
                      subtitle: Text(
                        '${filteredLocations[index].block} - ${filteredLocations[index].floor}',
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/details',
                          arguments: filteredLocations[index],
                        );
                      },
                    ),
                  );
                },
              ),

            const SizedBox(height: 20),

            // Faculty Overview Map
            Container(
              height: 150,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
              child: const Center(
                child: Text("Faculty Overview Map (Amni's Task)"),
              ),
            ),
            const SizedBox(height: 20),

            // Block Selection Grid
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: [
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

  Widget _buildBlockButton(BuildContext context, String title) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Card(
      elevation: 3,
      color: Theme.of(context).cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: Theme.of(context).brightness == Brightness.dark
              ? const Color(0xFF333333)
              : const Color(0xFFE0E0E0),
          width: 1.5,
        ),
      ),
      child: InkWell(
        onTap: () {
          // Navigate to specific block screen
          Navigator.pushNamed(context, '/block', arguments: title);
        },
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isDark ? const Color(0xFF43A047) : const Color(0xFF005B26),
            ),
          ),
        ),
      ),
    );
  }
}
