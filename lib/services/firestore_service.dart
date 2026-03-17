import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  FirestoreService._privateConstructor();
  static final FirestoreService instance =
      FirestoreService._privateConstructor();

  final FirebaseFirestore _db = FirebaseFirestore.instance;

  // =======================
  // DEPARTMENTS
  // =======================
  Stream<QuerySnapshot<Map<String, dynamic>>> getDepartments() {
    return _db.collection('departments').snapshots();
  }

  // =======================
  // SEMESTERS
  // =======================
  Stream<QuerySnapshot<Map<String, dynamic>>> getSemesters(
      String departmentCode) {
    return _db
        .collection('education')
        .doc(departmentCode)
        .collection('semesters')
        .orderBy('order')
        .snapshots();
  }

  // =======================
  // SUBJECTS
  // =======================
  Stream<QuerySnapshot<Map<String, dynamic>>> getSubjects({
    required String departmentCode,
    required String semesterId,
  }) {
    return _db
        .collection('education')
        .doc(departmentCode)
        .collection('semesters')
        .doc(semesterId)
        .collection('subjects')
        .orderBy('order')
        .snapshots();
  }

  // =======================
  // NOTES  ✅ THIS WAS MISSING
  // =======================
  Stream<QuerySnapshot<Map<String, dynamic>>> getNotes({
    required String departmentCode,
    required String semesterId,
    required String subjectId,
  }) {
    return _db
        .collection('education')
        .doc(departmentCode)
        .collection('semesters')
        .doc(semesterId)
        .collection('subjects')
        .doc(subjectId)
        .collection('notes')
        .orderBy('order')
        .snapshots();
  }
  // =======================
// YOUTUBE LECTURES
// =======================
Stream<QuerySnapshot<Map<String, dynamic>>> getYoutubeLectures({
  required String departmentCode,
  required String semesterId,
  required String subjectId,
}) {
  return _db
      .collection('education')
      .doc(departmentCode)
      .collection('semesters')
      .doc(semesterId)
      .collection('subjects')
      .doc(subjectId)
      .collection('youtube')
      .orderBy('order')
      .snapshots();
}

}
