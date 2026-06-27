import 'package:flutter/material.dart';
import '../models/location_model.dart';
import '../services/data_service.dart';
import 'package:fsktm_navigator/main.dart';

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
  centerTitle: true,
  title: const Text(
    'FSKTM Navigator',
    style: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
  ),
  backgroundColor: const Color.fromARGB(255, 126, 6, 8),
  actions: [
    IconButton(
      icon: Icon(
        themeNotifier.value == ThemeMode.dark
            ? Icons.light_mode
            : Icons.dark_mode,
        color: Colors.white,
      ),
      onPressed: () {
        setState(() {
          themeNotifier.value = themeNotifier.value == ThemeMode.light
              ? ThemeMode.dark
              : ThemeMode.light;
        });
      },
    ),
  ],
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
          ClipRRect(
           borderRadius: BorderRadius.circular(10),
           child: Image.asset(
            'assets/images/faculty_overview.png',
           height: 215,
           width: 300,
           fit: BoxFit.cover,
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
          ],
        ),
      ),
    );
  }

   Widget _buildBlockButton(
     BuildContext context,
     String title,
     Color color,
   ) {
     return Card(
      elevation: 3,

      color: Theme.of(context).brightness == Brightness.dark
    ? Theme.of(context).cardColor
    : Color.alphaBlend(
        color.withOpacity(0.09),
        Colors.white,
      ),

      shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(10),

         side: BorderSide(
           color: color,
           width: 2,
         ),
       ),

       child: InkWell(
         onTap: () {
           Navigator.pushNamed(
             context,
             '/block',
             arguments: title,
           );
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
}
