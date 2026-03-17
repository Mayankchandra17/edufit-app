import 'package:flutter/material.dart';

import 'notes_screen.dart';
import 'pyqs_screen.dart';
import 'youtube_screen.dart';

class SubjectDetailScreen extends StatelessWidget {
  final String departmentCode;
  final String semesterId;
  final String subjectId;
  final String subjectName;

  const SubjectDetailScreen({
    super.key,
    required this.departmentCode,
    required this.semesterId,
    required this.subjectId,
    required this.subjectName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(subjectName),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Notes'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => NotesScreen(
                    departmentId: departmentCode,
                    semesterId: semesterId,
                    subjectId: subjectId,
                  ),
                ),
              );
            },
          ),
          const Divider(height: 1),

          ListTile(
            title: const Text('PYQs'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => PyqsScreen(
                    departmentId: departmentCode,
                    semesterId: semesterId,
                    subjectId: subjectId,
                  ),
                ),
              );
            },
          ),
          const Divider(height: 1),

          ListTile(
            title: const Text('YouTube'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => YoutubeScreen(
                    departmentCode: departmentCode,
                    semesterId: semesterId,
                    subjectId: subjectId,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
