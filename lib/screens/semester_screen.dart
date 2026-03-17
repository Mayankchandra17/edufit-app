import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../services/firestore_service.dart';
import 'subjects_screen.dart';

class SemesterScreen extends StatelessWidget {
  final String departmentCode;
  final String departmentName;

  const SemesterScreen({
    super.key,
    required this.departmentCode,
    required this.departmentName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(departmentName),
      ),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirestoreService.instance.getSemesters(departmentCode),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No semesters found'));
          }

          final semesters = snapshot.data!.docs;

          return ListView.builder(
            itemCount: semesters.length,
            itemBuilder: (context, index) {
              final doc = semesters[index];
              final data = doc.data();

              return Card(
                margin:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                child: ListTile(
                  title: Text(data['name']),
                  subtitle: Text('Order ${data['order']}'),
                  trailing: const Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => SubjectsScreen(
                          departmentCode: departmentCode,
                          semesterId: doc.id,
                          semesterName: data['name'],
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
