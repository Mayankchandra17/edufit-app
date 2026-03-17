import 'package:flutter/material.dart';
import 'package:edufit/screens/pdf_viewer_screen.dart';

class NotesScreen extends StatelessWidget {
  final String subjectId;
  final String semesterId;
  final String departmentId;

  const NotesScreen({
    super.key,
    required this.subjectId,
    required this.semesterId,
    required this.departmentId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Notes')),
      body: Center(
        child: ElevatedButton(
          child: const Text('Open PDF'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const PdfViewerScreen(
                  pdfUrl: '/storage/emulated/0/Download/sample.pdf',
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
