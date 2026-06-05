import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/home_screen.dart';
import 'screens/block_screen.dart';
import 'screens/detail_screen.dart';

void main() {
  runApp(const FSKTMNavigatorApp());
}

class FSKTMNavigatorApp extends StatelessWidget {
  const FSKTMNavigatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FSKTM Navigator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.maroon, // Adapting to faculty colors
        useMaterial3: true,
      ),
      // Define the starting screen
      initialRoute: '/',
      // Centralized navigation paths
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const HomeScreen(),
        '/block': (context) => const BlockScreen(),
        '/details': (context) => const DetailScreen(),
      },
    );
  }
}
