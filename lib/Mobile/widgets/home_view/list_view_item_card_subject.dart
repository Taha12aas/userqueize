import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userqueize/Mobile/views/reading_generated_questions.dart';
import 'package:userqueize/Mobile/widgets/teachers_view_and_subjects_view/card_subjects.dart';
import 'package:userqueize/cubits/cubitSubject/cubit_subject.dart';
import 'package:userqueize/cubits/cubitSubject/cubit_subject_status.dart';
import 'package:userqueize/utils/font_style.dart';

class ListViewItemCardSubject extends StatelessWidget {
  const ListViewItemCardSubject({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CubitSubject, CubitSubjectStatus>(
      builder: (context, state) {
        if (state is SuccessStatee) {
          return Expanded(
              child: ListView.builder(
            itemCount: CubitSubject.subjectsCount.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: CardSubjects(
                  courseDate: CubitSubject.subjectsCount[index].coursesDate,
                  seasonSubject:
                      CubitSubject.subjectsCount[index].seasonSubject,
                  onTap: () {
                    Navigator.pushNamed(context, ReadingGeneratedQuestions.id,
                        arguments: [
                          CubitSubject.subjectsCount[index].nameSubject,
                          CubitSubject.subjectsCount[index].classSabject,
                          CubitSubject.subjectsCount[index].coursesDate,
                          CubitSubject.subjectsCount[index].seasonSubject,
                        ]);
                  },
                  subject: CubitSubject.subjectsCount[index].nameSubject,
                  classTeacher: CubitSubject.subjectsCount[index].classSabject,
                ),
              );
            },
          ));
        } else {
          return const Text(
            'لا يوجد اسئلة',
            style: FontStyleApp.orangeBold20,
          );
        }
      },
    );
  }
}
