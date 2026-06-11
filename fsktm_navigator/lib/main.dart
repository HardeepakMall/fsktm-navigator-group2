import 'package:flutter/material.dart';
import 'package:fsktm_navigator/screens/splash_screen.dart';
import 'package:fsktm_navigator/screens/home_screen.dart';
import 'package:fsktm_navigator/screens/block_screen.dart';
import 'package:fsktm_navigator/screens/detail_screen.dart';
import 'package:fsktm_navigator/screens/main_navigator.dart';

final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.system);

void main() {
  runApp(const FSKTMNavigatorApp());
}

class FSKTMNavigatorApp extends StatelessWidget {
  const FSKTMNavigatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (_, ThemeMode currentMode, __) {
        return MaterialApp(
          title: 'FSKTM Navigator',
          debugShowCheckedModeBanner: false,
          themeMode: currentMode,
          // light theme configuration
          theme: ThemeData(
            brightness: Brightness.light,
            primaryColor: Colors.teal,
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.teal,
              foregroundColor: Colors.white,
            ),
            useMaterial3: true,
          ),
          // dark theme configuration
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            primaryColor: Colors.teal,
            scaffoldBackgroundColor: Colors.black,
            appBarTheme: const AppBarTheme(
              backgroundColor: Color.fromARGB(255, 8, 115, 81),
              foregroundColor: Colors.white,
            ),
            cardColor: const Color(0xFF1E1E1E),
            useMaterial3: true,
          ),
          // Define the starting screen
          initialRoute: '/',
          // Centralized navigation paths
          routes: {
            '/': (context) => SplashScreen(),
            '/navigator': (context) => MainNavigator(),
            '/home': (context) => HomeScreen(),
            '/block': (context) => BlockScreen(),
            '/details': (context) => DetailScreen(),
          },
        );
      },
    );
  }
}
