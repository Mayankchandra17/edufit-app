import 'package:flutter/material.dart';
import 'fitness_plans_screen.dart';

class FitnessScreen extends StatelessWidget {
  const FitnessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Fitness',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _fitnessCard(
              context,
              title: 'Muscle Gain',
              icon: Icons.fitness_center,
            ),
            _fitnessCard(
              context,
              title: 'Weight Loss',
              icon: Icons.trending_down,
            ),
            _fitnessCard(
              context,
              title: 'Weight Gain',
              icon: Icons.trending_up,
            ),
            _fitnessCard(
              context,
              title: 'Regular Fitness',
              icon: Icons.directions_run,
            ),
          ],
        ),
      ),
    );
  }

  Widget _fitnessCard(
    BuildContext context, {
    required String title,
    required IconData icon,
  }) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => FitnessPlansScreen(category: title),
          ),
        );
      },
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 18),
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          color: const Color(0xFFE3F2FD),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.08),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 30,
              color: const Color(0xFF1565C0),
            ),
            const SizedBox(width: 18),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color(0xFF0D47A1),
              ),
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Color(0xFF1565C0),
            ),
          ],
        ),
      ),
    );
  }
}
