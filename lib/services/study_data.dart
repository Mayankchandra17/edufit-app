import '../models/subject_model.dart';

class StudyData {
  static const List<String> departments = [
    'IT',
    'CSE',
  ];

  static const List<Subject> subjects = [
    Subject(
      id: 'os',
      name: 'Operating Systems',
      department: 'IT',
      semester: 5,
      notes: [
        'Process & Threads',
        'CPU Scheduling',
        'Deadlocks',
        'Memory Management',
      ],
      pyqs: [
        'Explain deadlock conditions',
        'Difference between process and thread',
        'Paging vs Segmentation',
      ],
      videoLinks: [
        'https://www.youtube.com/watch?v=26QPDBe-NB8',
        'https://www.youtube.com/watch?v=exbKr6n0Uw',
      ],
    ),

    Subject(
      id: 'cn',
      name: 'Computer Networks',
      department: 'IT',
      semester: 5,
      notes: [
        'OSI Model',
        'TCP vs UDP',
        'IP Addressing',
        'Routing Algorithms',
      ],
      pyqs: [
        'Explain OSI layers',
        'TCP vs UDP',
        'Subnetting numericals',
      ],
      videoLinks: [
        'https://www.youtube.com/watch?v=qiQR5rTSshw',
      ],
    ),
  ];

  static List<Subject> getSubjects({
    required String department,
    required int semester,
  }) {
    return subjects
        .where(
          (s) => s.department == department && s.semester == semester,
        )
        .toList();
  }
}
