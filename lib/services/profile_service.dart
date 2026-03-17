import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfileService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  User? get currentUser => _auth.currentUser;

  /// Stream user profile data from Firestore
  Stream<DocumentSnapshot<Map<String, dynamic>>> userProfileStream() {
    final user = currentUser;
    if (user == null) {
      throw Exception('User not logged in');
    }

    return _firestore
        .collection('users')
        .doc(user.uid)
        .snapshots();
  }

  /// Create user profile (called once at signup)
  Future<void> createUserProfile({
    required String name,
    required String email,
  }) async {
    final user = currentUser;
    if (user == null) return;

    await _firestore.collection('users').doc(user.uid).set({
      'name': name,
      'email': email,
      'createdAt': FieldValue.serverTimestamp(),
    });
  }

  /// Update profile fields safely
  Future<void> updateProfile(Map<String, dynamic> data) async {
    final user = currentUser;
    if (user == null) return;

    await _firestore.collection('users').doc(user.uid).update(data);
  }
}
