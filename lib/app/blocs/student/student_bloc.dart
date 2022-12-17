import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:bloc_crud_siswa_firebase/app/models/student/student.dart';
import 'package:bloc_crud_siswa_firebase/app/repository/student/student_repo.dart';
import 'package:equatable/equatable.dart';

part 'student_event.dart';
part 'student_state.dart';

class StudentBloc extends Bloc<StudentEvent, StudentState> {
  final StudentRepository _studentRepository;
  StreamSubscription? _studentSubscription;
  StudentBloc({required StudentRepository studentRepository})
      : _studentRepository = studentRepository,
        super(StudentLoading()) {
    on<StudentEvent>((event, emit) {
      if (event is LoadStudent) {
        _onLoadStudentToState();
      } else if (event is UpdateStudent) {
        _onUpdateStudentToState(event, emit);
      }
    });
    on<AddStudent>(
      (event, emit) {
        studentRepository.store(event.student.toDocument());
      },
    );
    on<EditStudent>(
      (event, emit) {
        studentRepository.update(event.student.uid, event.student.toDocument());
      },
    );
    on<RemoveStudent>(
      (event, emit) {
        studentRepository.destroy(event.uid);
      },
    );
  }

  void _onLoadStudentToState() {
    _studentSubscription?.cancel();
    _studentSubscription = _studentRepository.getData().listen((student) {
      return add(UpdateStudent(student));
    });
  }

  void _onUpdateStudentToState(
      UpdateStudent event, Emitter<StudentState> emit) {
    emit(StudentLoaded(students: event.students));
  }
}
