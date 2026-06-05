import 'package:flutter/material.dart';
import 'package:fsktm_navigator/screens/splash_screen.dart';
import 'package:fsktm_navigator/screens/home_screen.dart';
import 'package:fsktm_navigator/screens/block_screen.dart';
import 'package:fsktm_navigator/screens/detail_screen.dart';


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
        primarySwatch: Colors.teal, // Adapting to faculty colors
        //primarySwatch: Colors.maroon, // Adapting to faculty colors
        useMaterial3: true,
      ),
      // Define the starting screen
      initialRoute: '/',
      // Centralized navigation paths
      routes: {
        '/': (context) => SplashScreen(),
        '/home': (context) => HomeScreen(),
        '/block': (context) => BlockScreen(),
        '/details': (context) => DetailScreen(),
      },
    );
  }
}
