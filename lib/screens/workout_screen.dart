import 'package:flutter/material.dart';

class WorkoutScreen extends StatelessWidget {
  const WorkoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Workout Plans'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'Workout plans will be shown here',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
