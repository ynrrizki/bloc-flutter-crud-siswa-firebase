import 'package:bloc_crud_siswa_firebase/app/blocs/blocs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:bloc_crud_siswa_firebase/app/models/student/student.dart';
import 'package:bloc_crud_siswa_firebase/ui/pages/home_page.dart';
import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class EditPage extends StatefulWidget {
  final Student student;
  const EditPage({super.key, required this.student});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController impianController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    nameController.text = widget.student.name;
    ageController.text = widget.student.age.toString();
    impianController.text = widget.student.impian;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      appBar: AppBar(
        title: const Text('Update Data'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Container(
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: Colors.white,
            ),
            child: Column(
              children: [
                TextFieldWidget(
                  label: 'Name',
                  controller: nameController,
                ),
                const SizedBox(height: 40),
                TextFieldWidget(
                  label: 'Age',
                  controller: ageController,
                ),
                const SizedBox(height: 40),
                TextFieldWidget(
                  label: 'Impian',
                  controller: impianController,
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    context.read<StudentBloc>().add(
                          EditStudent(
                            Student(
                              uid: widget.student.uid,
                              name: nameController.text,
                              age: int.parse(ageController.text),
                              impian: impianController.text,
                            ),
                          ),
                        );
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
                        ),
                        (route) => false);
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 0),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  child: const Text('Save'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
