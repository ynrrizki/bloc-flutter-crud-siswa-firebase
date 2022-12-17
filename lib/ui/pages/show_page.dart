import 'package:bloc_crud_siswa_firebase/app/blocs/blocs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_crud_siswa_firebase/app/models/models.dart';
import 'package:bloc_crud_siswa_firebase/ui/pages/edit_page.dart';
import 'package:bloc_crud_siswa_firebase/ui/pages/home_page.dart';

class ShowPage extends StatelessWidget {
  final Student student;
  const ShowPage({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Read One Data'),
        centerTitle: true,
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: null,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => EditPage(student: student),
                ),
              );
            },
            child: const Icon(Icons.edit),
          ),
          const SizedBox(height: 20),
          FloatingActionButton(
            heroTag: null,
            onPressed: () {
              context.read<StudentBloc>().add(RemoveStudent(student.uid));
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
                (route) => false,
              );
            },
            backgroundColor: Colors.red,
            child: const Icon(Icons.delete),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: ListTile(
                leading: const Icon(CupertinoIcons.profile_circled, size: 50),
                title: Text(student.name),
                subtitle: Text(
                    'Aku ${student.impian}, masih berumur ${student.age} tahun'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
