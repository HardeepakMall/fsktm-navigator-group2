import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'providers/theme_provider.dart';
import 'package:fsktm_navigator/screens/floor_screen.dart';
import 'package:fsktm_navigator/screens/splash_screen.dart';
import 'package:fsktm_navigator/screens/home_screen.dart';
import 'package:fsktm_navigator/screens/block_screen.dart';
import 'package:fsktm_navigator/screens/detail_screen.dart';
import 'package:fsktm_navigator/screens/main_navigator.dart';
import 'package:fsktm_navigator/screens/facility_screen.dart';



void main() {
  runApp(const ProviderScope(
    child: FSKTMNavigatorApp(),
  ), 
  ); //providerscope stores all providers so must wrap entire app
}

class FSKTMNavigatorApp extends ConsumerWidget {
  const FSKTMNavigatorApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentMode = ref.watch(themeProvider);
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
            '/floor': (context) => FloorScreen(),
            '/details': (context) => DetailScreen(),
            '/facilityList': (context) => FacilityListScreen(),
          },
        );
  }
}
