import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:url_launcher/url_launcher.dart';
import '../services/firestore_service.dart';

class YoutubeScreen extends StatelessWidget {
  final String departmentCode;
  final String semesterId;
  final String subjectId;

  const YoutubeScreen({
    super.key,
    required this.departmentCode,
    required this.semesterId,
    required this.subjectId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('YouTube Lectures')),
      body: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
        stream: FirestoreService.instance.getYoutubeLectures(
          departmentCode: departmentCode,
          semesterId: semesterId,
          subjectId: subjectId,
        ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return const Center(child: Text('No lectures found'));
          }

          final lectures = snapshot.data!.docs;

          return ListView.builder(
            itemCount: lectures.length,
            itemBuilder: (context, index) {
              final data = lectures[index].data();
              return ListTile(
                leading: const Icon(Icons.play_circle_fill),
                title: Text(data['title'] ?? 'Lecture'),
                onTap: () async {
                  final url = Uri.parse(data['url']);
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url, mode: LaunchMode.externalApplication);
                  }
                },
              );
            },
          );
        },
      ),
    );
  }
}
