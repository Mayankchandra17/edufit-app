import 'package:flutter/material.dart';

class DietPlansScreen extends StatelessWidget {
  final String category;

  const DietPlansScreen({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    final diets = _getDietPlans(category);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '$category • Diet Plans',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: diets.length,
        itemBuilder: (context, index) {
          return _dietCard(diets[index]);
        },
      ),
    );
  }

  List<String> _getDietPlans(String category) {
    switch (category) {
      case 'Muscle Gain':
        return [
          'High Protein Diet',
          'Bulking Meal Plan',
          'Lean Mass Diet'
        ];
      case 'Weight Loss':
        return [
          'Calorie Deficit Plan',
          'Low Carb Diet',
          'Intermittent Fasting'
        ];
      case 'Weight Gain':
        return [
          'High Calorie Diet',
          'Balanced Weight Gain Plan'
        ];
      case 'Regular Fitness':
        return [
          'Balanced Daily Diet',
          'Maintenance Nutrition Plan'
        ];
      default:
        return ['General Diet Plan'];
    }
  }

  Widget _dietCard(String plan) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFFE1F5FE),
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
          const Icon(Icons.restaurant, color: Color(0xFF0277BD)),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              plan,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF01579B),
              ),
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 16),
        ],
      ),
    );
  }
}
