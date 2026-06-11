import 'package:flutter/material.dart';
import 'package:fsktm_navigator/screens/green_awareness.dart';
import 'home_screen.dart';

// Import placeholders (You will create these files next)
// import 'search_screen.dart';
// import 'map_screen.dart';
// import 'green_screen.dart';
import 'about_screen.dart';

class MainNavigator extends StatefulWidget {
  const MainNavigator({super.key});

  @override
  State<MainNavigator> createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  int _selectedIndex = 0;

  // The list of screens that correspond to the tabs
  final List<Widget> _screens = [
    const HomeScreen(),

    // Placeholders for the other tabs until your team builds them
    const Center(child: Text('Search Screen (To be built)')),
    const Center(child: Text('Map Screen (Optional Bonus)')),
    const GreenAwareness(),
    const AboutScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // The body changes based on which tab is selected
      body: _screens[_selectedIndex],

      // The universal bottom navigation bar
      bottomNavigationBar: BottomNavigationBar(
        type:
            BottomNavigationBarType.fixed, // Keeps all labels and icons visible
        backgroundColor: Colors.white,
        selectedItemColor: const Color.fromARGB(255, 126, 6, 8), // UPM Maroon
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.map_outlined), label: 'Map'),
          BottomNavigationBarItem(icon: Icon(Icons.eco), label: 'Green'),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            label: 'About',
          ),
        ],
      ),
    );
  }
}
