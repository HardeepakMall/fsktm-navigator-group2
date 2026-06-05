import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fsktm_navigator/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/splash_bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    const SizedBox(height: 35),

                    Image.asset('assets/images/upm_logo.png', height: 90),

                    const SizedBox(height: 9),

                    const Text(
                      'FSKTM',
                      style: TextStyle(
                        fontSize: 47,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 0, 91, 38),
                      ),
                    ),

                    const Text(
                      'NAVIGATOR',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 0, 170, 71),
                      ),
                    ),

                    const SizedBox(height: 6),

                    const Text(
                      'Navigate • Explore • Go Green',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(221, 0, 0, 0),
                      ),
                    ),

                    SizedBox(height: MediaQuery.of(context).size.height * 0.27),

                    const Text(
                      'SSE3401 Mobile Application Development',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),

                    const SizedBox(height: 3),

                    const Text(
                      'Lecturer: Ts. Dr. Sufri Muhammad',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),

                    const SizedBox(height: 1),

                    const Text(
                      'Sem 2 2025/2026',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),

                    const SizedBox(height: 30),

                    const Text(
                      'Group 2 Members:',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),

                    const SizedBox(height: 3),

                    const Text(
                      '1. Hardeepak Kaur Mall (225220)',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),

                    const SizedBox(height: 2),

                    const Text(
                      '2. Amni Humaira Bt Azham (225547)',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),

                    const SizedBox(height: 2),

                    const Text(
                      '3. Damia Nasreen Bt Abdul Aziz (SA00125)',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),

                    const SizedBox(height: 2),

                    const Text(
                      '4. Wang Yihan (218583)',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
