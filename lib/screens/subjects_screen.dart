import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../services/firestore_service.dart';
import 'subject_detail_screen.dart';

class SubjectsScreen extends StatelessWidget {
  final String departmentCode;
  final String semesterId;
  final String semesterName;

  const SubjectsScreen({
    super.key,
    required this.departmentCode,
    required this.semesterId,
    required this.semesterName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(semesterName),
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirestoreService.instance.getSubjects(
          departmentCode: departmentCode,
          semesterId: semesterId,
        ),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text('No subjects found'),
            );
          }

          final subjects = snapshot.data!.docs;

          return ListView.builder(
            itemCount: subjects.length,
            itemBuilder: (context, index) {
              final doc = subjects[index];
              final data = doc.data();

              return Card(
                margin: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                child: ListTile(
                  title: Text(data['name'] ?? ''),
                  subtitle: Text(data['code'] ?? ''),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => SubjectDetailScreen(
                          departmentCode: departmentCode,
                          semesterId: semesterId,
                          subjectId: doc.id,
                          subjectName: data['name'] ?? '',
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
