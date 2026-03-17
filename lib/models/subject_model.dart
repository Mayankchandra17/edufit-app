class Subject {
  final String id;
  final String name;
  final String department;
  final int semester;
  final List<String> notes;
  final List<String> pyqs;
  final List<String> videoLinks;

  const Subject({
    required this.id,
    required this.name,
    required this.department,
    required this.semester,
    required this.notes,
    required this.pyqs,
    required this.videoLinks,
  });
}
