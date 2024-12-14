import 'package:flutter/material.dart';
import 'package:userqueize/Mobile/views/generated_questions_view.dart';
import 'package:userqueize/Mobile/widgets/teachers_view_and_subjects_view/card_subjects.dart';
import 'package:userqueize/Service/teacher_service.dart';
import 'package:userqueize/models/teacher.dart';

class ListViewCardSubjects extends StatelessWidget {
  const ListViewCardSubjects({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 10),
          child: CardSubjects(
            subject: 'رياضات',
            teacherImag: 'assets/images/Teachers.png',
            onTap: () async {
              final teacherService = TeacherService();
              await teacherService.createTeacher(Teacher(
                  name: 'name',
                  photo: 'photo',
                  phone: 'phone',
                  address: 'address',
                  password: 'password',
                  verificationCode: 'verificationCode',
                  createdAt: DateTime.now()));

              // ignore: use_build_context_synchronously
              Navigator.pushNamed(context, GeneratedQuestionsView.id);
            },
          ),
        );
      },
    );
  }
}
