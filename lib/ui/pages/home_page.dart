import 'package:bloc_crud_siswa_firebase/app/blocs/blocs.dart';
import 'package:bloc_crud_siswa_firebase/ui/pages/create_page.dart';
import 'package:bloc_crud_siswa_firebase/ui/widgets/student_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get Data'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CreatePage(),
            ),
          );
        },
      ),
      body: BlocBuilder(
        bloc: context.read<StudentBloc>(),
        builder: (context, state) {
          if (state is StudentLoaded) {
            return ListView.builder(
              itemCount: state.students.length,
              itemBuilder: (context, index) {
                return StudentCardWidget(student: state.students[index]);
              },
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
