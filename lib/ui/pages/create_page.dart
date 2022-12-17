import 'package:bloc_crud_siswa_firebase/app/models/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_crud_siswa_firebase/app/blocs/blocs.dart';
import 'package:bloc_crud_siswa_firebase/ui/pages/home_page.dart';
import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

class CreatePage extends StatefulWidget {
  const CreatePage({super.key});

  @override
  State<CreatePage> createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController impianController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 240, 240, 240),
      appBar: AppBar(
        title: const Text('Create Data'),
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
                    nameController.text;
                    ageController.text;
                    impianController.text;
                    context.read<StudentBloc>().add(
                          AddStudent(
                            Student(
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
