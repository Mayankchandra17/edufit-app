class FitnessGoal {
  final String id;
  final String title;
  final String description;
  final String image;
  final List<String> workouts;
  final List<String> dietPlan;
  final List<String> habits;

  const FitnessGoal({
    required this.id,
    required this.title,
    required this.description,
    required this.image,
    required this.workouts,
    required this.dietPlan,
    required this.habits,
  });

  /// This makes it Firebase-ready later
  factory FitnessGoal.fromMap(Map<String, dynamic> map, String id) {
    return FitnessGoal(
      id: id,
      title: map['title'],
      description: map['description'],
      image: map['image'],
      workouts: List<String>.from(map['workouts']),
      dietPlan: List<String>.from(map['dietPlan']),
      habits: List<String>.from(map['habits']),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'image': image,
      'workouts': workouts,
      'dietPlan': dietPlan,
      'habits': habits,
    };
  }
}
