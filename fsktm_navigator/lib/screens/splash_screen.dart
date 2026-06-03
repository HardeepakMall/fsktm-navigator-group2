import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              // UPM Logo
              Image.asset(
                'lib/assets/images/upm_logo.png',
                height: 100,
              ),

              SizedBox(height: 20),

              // FSKTM
              Text(
                'FSKTM',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),

              // Navigator
              Text(
                'NAVIGATOR',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),

              SizedBox(height: 10),

              // Tagline
              Text(
                'Navigate • Explore • Go Green',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                ),
              ),

              SizedBox(height: 30),

              // Group Info
              Text(
                'Developed by Group 2',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),

              SizedBox(height: 5),

              Text(
                'SSE3401 Mobile Application Development',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),

              SizedBox(height: 5),

              Text(
                'Semester 2 2025/2026',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}