import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Student extends Equatable {
  final dynamic uid;
  final String name;
  final int age;
  final String impian;

  const Student({
    this.uid,
    required this.name,
    required this.age,
    required this.impian,
  });

  // from firebase to app
  factory Student.fromSnapshot(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final data = snapshot;
    return Student(
      uid: data.id,
      name: data['name'],
      age: data['age'],
      impian: data['impian'],
    );
  }

  // frome app to firebase
  Map<String, dynamic> toDocument() => {
        "name": name,
        "age": age,
        "impian": impian,
      };

  @override
  List<Object?> get props => [uid, name, age, impian];
}
