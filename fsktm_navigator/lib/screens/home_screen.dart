import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/location_model.dart';
import '../providers/theme_provider.dart';
import '../providers/locations_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  List<Location> filteredLocations = [];
  TextEditingController searchController = TextEditingController();

  void _runSearch(String enteredKeyword) {
    // Read the current locations from the provider
    final allLocations = ref.read(locationsProvider).value ?? [];
    List<Location> results = [];

    if (enteredKeyword.isEmpty) {
      results = [];
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
    // Watch the provider so the screen rebuilds when data first loads
    ref.watch(locationsProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'FSKTM Navigator',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 126, 6, 8),
        actions: [
          IconButton(
            icon: Icon(
              ref.watch(themeProvider) == ThemeMode.dark
                  ? Icons.light_mode
                  : Icons.dark_mode,
              color: Colors.white,
            ),
            onPressed: () {
              ref.read(themeProvider.notifier).toggle();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
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

            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                width: 300,
                height: 215,
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    return Stack(
                      children: [
                        Image.asset(
                          'assets/images/faculty_overview.png',
                          width: constraints.maxWidth,
                          height: constraints.maxHeight,
                          fit: BoxFit.cover,
                        ),

                        _mapButton(
                          context,
                          'Block A',
                          const Color.fromARGB(255, 255, 193, 7),
                          constraints.maxWidth * 0.34,
                          constraints.maxHeight * 0.25,
                          75,
                          135,
                        ),

                        _mapButton(
                          context,
                          'Block B',
                          const Color.fromARGB(255, 174, 32, 22),
                          constraints.maxWidth * 0.09,
                          constraints.maxHeight * 0.25,
                          75,
                          135,
                        ),

                        _mapButton(
                          context,
                          'Block C',
                          const Color.fromARGB(255, 62, 47, 230),
                          constraints.maxWidth * 0.69,
                          constraints.maxHeight * 0.16,
                          78,
                          170,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 28),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Blocks',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),

            const SizedBox(height: 12),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: [
                _buildBlockButton(
                  context,
                  "Block A",
                  const Color.fromARGB(255, 255, 193, 7),
                ),
                _buildBlockButton(
                  context,
                  "Block B",
                  const Color.fromARGB(255, 174, 32, 22),
                ),
                _buildBlockButton(
                  context,
                  "Block C",
                  const Color.fromARGB(255, 62, 47, 230),
                ),
              ],
            ),
            const SizedBox(height: 28),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Facilities',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),

            const SizedBox(height: 12),

            Row(
              children: [
                Expanded(
                  child: _buildFacilityButton(context, 'Toilet', Icons.wc),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _buildFacilityButton(
                    context,
                    'Prayer Room',
                    Icons.mosque,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _buildCafeButton(context, 'Kafe', Icons.restaurant),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBlockButton(BuildContext context, String title, Color color) {
    return Card(
      elevation: 3,
      color: Theme.of(context).brightness == Brightness.dark
          ? Theme.of(context).cardColor
          : Color.alphaBlend(color.withOpacity(0.09), Colors.white),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: color, width: 2),
      ),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/block', arguments: title);
        },
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: color,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFacilityButton(
    BuildContext context,
    String title,
    IconData icon,
  ) {
    return Card(
      elevation: 3,
      color: Theme.of(context).brightness == Brightness.dark
          ? Theme.of(context).cardColor
          : const Color(0xFFEAF5E5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(color: Color(0xFF005B26), width: 1.5),
      ),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, '/facilityList', arguments: title);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: Column(
            children: [
              Icon(
                icon,
                color: const Color.fromARGB(255, 3, 121, 70),
                size: 28,
              ),
              const SizedBox(height: 6),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : const Color(0xFF005B26),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCafeButton(BuildContext context, String title, IconData icon) {
    return Card(
      elevation: 3,
      color: Theme.of(context).brightness == Brightness.dark
          ? Theme.of(context).cardColor
          : const Color(0xFFEAF5E5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: const BorderSide(
          color: Color.fromARGB(255, 3, 121, 70),
          width: 1.5,
        ),
      ),
      child: InkWell(
        onTap: () {
          // Safely find cafe — returns null instead of crashing if not found
          final locations = ref.read(locationsProvider).value ?? [];
          final cafe = locations.cast<dynamic>().firstWhere(
            (location) =>
                location.type.toLowerCase() == 'cafeteria' ||
                location.name.toLowerCase().contains('cafe') ||
                location.name.toLowerCase().contains('kafe'),
            orElse: () => null,
          );

          if (cafe == null) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Cafe information is not available yet.'),
              ),
            );
            return;
          }

          Navigator.pushNamed(context, '/details', arguments: cafe);
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14),
          child: Column(
            children: [
              Icon(
                icon,
                color: const Color.fromARGB(255, 3, 121, 70),
                size: 28,
              ),
              const SizedBox(height: 6),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : const Color(0xFF005B26),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _mapButton(
    BuildContext context,
    String title,
    Color color,
    double left,
    double top,
    double width,
    double height,
  ) {
    return Positioned(
      left: left,
      top: top,
      child: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/block', arguments: title);
        },
        child: Container(
          width: width,
          height: height,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.white, width: 1.5),
          ),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 11,
            ),
          ),
        ),
      ),
    );
  }
}
