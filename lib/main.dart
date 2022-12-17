import 'package:flutter/material.dart';
import 'package:bloc_crud_siswa_firebase/ui/pages/home_page.dart';
// BLOC/CUBIT
import 'package:flutter_bloc/flutter_bloc.dart';
import 'app/blocs/blocs.dart';
// FIREBASE
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
// REPO
import 'package:bloc_crud_siswa_firebase/app/repository/student/student_repo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StudentBloc(
        studentRepository: StudentRepository(),
      )..add(LoadStudent()),
      child: MaterialApp(
        title: 'Student CRUD',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
      ),
    );
  }
}
