import 'package:flutter/material.dart';

class DietScreen extends StatelessWidget {
  const DietScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diet Plans'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Diet plans will be shown here',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
