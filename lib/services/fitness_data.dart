import '../models/fitness_goal_model.dart';

class FitnessData {
  static const List<FitnessGoal> goals = [
    FitnessGoal(
      id: 'weight_loss',
      title: 'Weight Loss',
      description: 'Burn fat and improve stamina',
      image: 'assets/images/weight_loss.png',
      workouts: [
        'Jump Rope – 10 mins',
        'Running – 20 mins',
        'Bodyweight Squats – 3x15',
        'Plank – 3x30 sec',
      ],
      dietPlan: [
        'High protein breakfast',
        'Low carb lunch',
        'Green vegetables',
        'No sugar drinks',
      ],
      habits: [
        '8k steps daily',
        'Drink 3L water',
        'Sleep 7–8 hours',
      ],
    ),

    FitnessGoal(
      id: 'muscle_gain',
      title: 'Muscle Gain',
      description: 'Build strength and size',
      image: 'assets/images/muscle_gain.png',
      workouts: [
        'Push-ups – 4x15',
        'Pull-ups – 4x8',
        'Dumbbell curls – 3x12',
        'Bench press – 4x10',
      ],
      dietPlan: [
        'High calorie meals',
        'Protein shakes',
        'Eggs & chicken',
        'Complex carbs',
      ],
      habits: [
        'Progressive overload',
        'Rest days',
        'Track protein intake',
      ],
    ),

    FitnessGoal(
      id: 'weight_gain',
      title: 'Weight Gain',
      description: 'Healthy mass gain',
      image: 'assets/images/weight_gain.png',
      workouts: [
        'Compound lifts',
        'Light cardio',
        'Resistance training',
      ],
      dietPlan: [
        'Calorie surplus',
        'Milk & nuts',
        'Frequent meals',
      ],
      habits: [
        'Consistent meals',
        'Avoid junk',
        'Strength focus',
      ],
    ),
  ];
}
