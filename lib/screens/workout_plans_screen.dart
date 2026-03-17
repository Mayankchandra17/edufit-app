import 'package:flutter/material.dart';

class WorkoutPlansScreen extends StatelessWidget {
  final String category;

  const WorkoutPlansScreen({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    final plans = _getPlans(category);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '$category • Workouts',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: plans.length,
        itemBuilder: (context, index) {
          return _planCard(plans[index]);
        },
      ),
    );
  }

  List<String> _getPlans(String category) {
    switch (category) {
      case 'Muscle Gain':
        return ['Beginner Mass Plan', 'Intermediate Hypertrophy', 'Advanced Split'];
      case 'Weight Loss':
        return ['Fat Burn Beginner', 'HIIT Plan', 'Extreme Cut'];
      case 'Weight Gain':
        return ['Lean Gain Plan', 'Calorie Surplus Routine'];
      case 'Regular Fitness':
        return ['Full Body Routine', 'Daily Fitness Plan'];
      default:
        return ['General Workout'];
    }
  }

  Widget _planCard(String plan) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFE3F2FD),
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.fitness_center, color: Color(0xFF1565C0)),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              plan,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF0D47A1),
              ),
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 16),
        ],
      ),
    );
  }
}
