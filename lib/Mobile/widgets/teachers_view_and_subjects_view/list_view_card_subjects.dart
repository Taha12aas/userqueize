import 'package:flutter/material.dart';
import 'package:userqueize/Mobile/views/generated_questions_view.dart';
import 'package:userqueize/Mobile/widgets/teachers_view_and_subjects_view/card_subjects.dart';

class ListViewCardSubjects extends StatelessWidget {
  const ListViewCardSubjects({
    super.key,
    required this.listSubject, required this.listClasses,
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
            child: CardSubjects(
              classTeacher: listClasses[index],
              subject: listSubject[index],
              teacherImag: 'assets/images/Teachers.png',
              onTap: () {
                // ignore: use_build_context_synchronously
                Navigator.pushNamed(context, GeneratedQuestionsView.id);
              },
            ));
      },
    );
  }
}
