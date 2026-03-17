import 'package:flutter/material.dart';

class PyqsScreen extends StatelessWidget {
  const PyqsScreen({super.key, required String subjectId, required String semesterId, required String departmentId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PYQs'),
      ),
      body: const Center(
        child: Text(
          'PYQs coming soon',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
