import 'package:bloc_crud_siswa_firebase/app/models/student/student.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'repository.dart';

class StudentRepository implements Repository {
  final FirebaseFirestore _firebaseFirestore;

  StudentRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Student>> getData() {
    return _firebaseFirestore
        .collection("students")
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((docs) => Student.fromSnapshot(docs)).toList();
    });
  }

  @override
  Future<void> store(Map<String, dynamic> data) async {
    _firebaseFirestore.collection("students").add(data);
  }

  @override
  Future<void> update(dynamic uid, Map<String, dynamic> data) async {
    _firebaseFirestore.collection("students").doc(uid).update(data);
  }

  @override
  Future<void> destroy(dynamic uid) async {
    _firebaseFirestore.collection("students").doc(uid).delete();
  }
}
