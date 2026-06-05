import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF005B26), // UPM Green
      ),
      backgroundColor: Colors.grey[100],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Image.asset('assets/images/upm_logo.png', height: 100),
            const SizedBox(height: 20),

            const Text(
              'FSKTM',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 0, 91, 38),
              ),
            ),
            const Text(
              'NAVIGATOR',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 0, 170, 71),
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Navigate • Explore • Go Green',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),

            const Divider(height: 40, thickness: 2),

            // Course Info Container
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
              ),
              child: const Column(
                children: [
                  Text(
                    'SSE3401 Mobile Application Development',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Lecturer: Ts. Dr. Sufri Muhammad',
                    style: TextStyle(fontSize: 15),
                  ),
                  Text('Sem 2 2025/2026', style: TextStyle(fontSize: 15)),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Team Members Container
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF005B26),
                borderRadius: BorderRadius.circular(12),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Group 2 Members:',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '1. Hardeepak Kaur Mall (225220)',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '2. Amni Humaira Bt Azham (225547)',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '3. Damia Nasreen Bt Abdul Aziz (SA00125)',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  SizedBox(height: 5),
                  Text(
                    '4. Wang Yihan (218583)',
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
