import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'login_screen.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final User? user = FirebaseAuth.instance.currentUser;

  Future<void> _logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();

    if (!context.mounted) return;

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (_) => const LoginScreen()),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              child: Icon(Icons.person, size: 50),
            ),
            const SizedBox(height: 16),

            Text(
              user?.email ?? 'No Email Found',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),

            const SizedBox(height: 32),

            const ListTile(
              leading: Icon(Icons.school),
              title: Text('Academic Progress'),
              subtitle: Text('Coming Soon'),
            ),

            const ListTile(
              leading: Icon(Icons.fitness_center),
              title: Text('Fitness Progress'),
              subtitle: Text('Coming Soon'),
            ),

            const ListTile(
              leading: Icon(Icons.notifications),
              title: Text('Reminders'),
              subtitle: Text('Coming Soon'),
            ),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                onPressed: () => _logout(context),
                child: const Text('Logout'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
