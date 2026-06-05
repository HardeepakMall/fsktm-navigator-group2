import 'package:flutter/material.dart';

// Make sure this name is exactly "BlockScreen" with no underscores or lowercase 's'
class BlockScreen extends StatelessWidget {
  const BlockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Block Screen')));
  }
}
