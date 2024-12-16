import 'package:flutter/material.dart';
import 'package:userqueize/Mobile/views/generated_questions_view.dart';
import 'package:userqueize/Mobile/widgets/teachers_view_and_subjects_view/card_subjects.dart';

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
            classTeacher: 'صف الاول',
            subject: 'رياضات',
            teacherImag: 'assets/images/Teachers.png',
            subject: 'رياضات',
            onTap: () {
              // ignore: use_build_context_synchronously
              Navigator.pushNamed(context, GeneratedQuestionsView.id);
            },
          ),
        );
      },
    );
  }
}
