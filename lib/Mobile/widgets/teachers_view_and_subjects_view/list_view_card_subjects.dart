import 'package:flutter/material.dart';
import 'package:userqueize/Mobile/views/question_generate_view.dart';
import 'package:userqueize/Mobile/widgets/teachers_view_and_subjects_view/card_teacher_subject.dart';

class ListViewCardSubjects extends StatelessWidget {
  const ListViewCardSubjects({
    super.key,
    required this.listSubject,
    required this.listClasses,
  });
  final List<dynamic> listSubject;
  final List<dynamic> listClasses;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: listSubject.length,
      itemBuilder: (context, index) {
        return Padding(
            padding: const EdgeInsets.only(top: 10),
            child: CardTeacherSubject(
              classTeacher: listClasses[index],
              subject: listSubject[index],
              teacherImag: 'assets/images/Teachers.png',
              onTap: () {
                Navigator.pushNamed(context, QuestionGenerateView.id);
              },
            ));
      },
    );
  }
}
