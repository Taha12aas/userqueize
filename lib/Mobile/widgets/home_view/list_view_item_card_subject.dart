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
            itemCount: state.subjects!.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: CardSubjects(
                  courseDate: state.subjects![index].coursesDate,
                  seasonSubject: state.subjects![index].seasonSubject,
                  onTap: () {
                    Navigator.pushNamed(context, ReadingGeneratedQuestions.id,
                        arguments: [
                          state.subjects![index].nameSubject,
                          state.subjects![index].classSabject,
                          state.subjects![index].coursesDate,
                          state.subjects![index].seasonSubject,
                        ]);
                  },
                  subject: state.subjects![index].nameSubject,
                  classTeacher: state.subjects![index].classSabject,
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
