import 'package:bloc_crud_siswa_firebase/app/models/models.dart';
import 'package:bloc_crud_siswa_firebase/ui/pages/show_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StudentCardWidget extends StatelessWidget {
  final Student student;
  const StudentCardWidget({Key? key, required this.student}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => ShowPage(student: student),
            ),
          );
        },
        leading: const Icon(CupertinoIcons.profile_circled, size: 40),
        title: Text(student.name),
        subtitle: Text('${student.age}'),
      ),
    );
  }
}
