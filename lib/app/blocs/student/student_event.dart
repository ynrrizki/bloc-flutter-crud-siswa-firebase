part of 'student_bloc.dart';

abstract class StudentEvent extends Equatable {
  const StudentEvent();

  @override
  List<Object> get props => [];
}

class LoadStudent extends StudentEvent {}

class UpdateStudent extends StudentEvent {
  final List<Student> students;

  const UpdateStudent(this.students);

  @override
  List<Object> get props => [students];
}

class AddStudent extends StudentEvent {
  final Student student;

  const AddStudent(this.student);

  @override
  List<Object> get props => [student];
}

class EditStudent extends StudentEvent {
  final Student student;
  const EditStudent(this.student);

  @override
  List<Object> get props => [student];
}

class RemoveStudent extends StudentEvent {
  final dynamic uid;

  const RemoveStudent(this.uid);

  @override
  List<Object> get props => [uid];
}
