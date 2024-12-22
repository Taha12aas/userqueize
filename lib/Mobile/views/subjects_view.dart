import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userqueize/Mobile/widgets/teachers_view_and_subjects_view/card_subjects.dart';
import 'package:userqueize/Mobile/widgets/teachers_view_and_subjects_view/teacher_profile_card.dart';
import 'package:userqueize/cubits/cubitSubject/cubit_subject.dart';
import 'package:userqueize/cubits/cubitSubject/cubit_subject_status.dart';
import 'package:userqueize/utils/custom_app_bar.dart';
import 'package:userqueize/utils/font_style.dart';

class SubjectsView extends StatelessWidget {
  const SubjectsView({super.key});
  static String id = 'SubjectsView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('المواد', context),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Align(
              alignment: Alignment.center,
              child: TeacherProfileCard(),
            ),
            const SizedBox(
              height: 20,
            ),
            BlocBuilder<CubitSubject, CubitSubjectStatus>(
              builder: (context, state) {
                if (state is SuccessStatee) {
                  return Expanded(
                      child: ListView.builder(
                    itemCount: state.subjects!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: CardSubjects(
                          onTap: () {},
                          subject: state.subjects![index].nameSubject,
                          teacherImag: 'assets/images/subjects.png',
                          classTeacher: state.subjects![index].classSabject,
                        ),
                      );
                    },
                  ));
                } else {
                  return const Text(
                    'لا يوجد اسئلة',
                    style: FontStyleApp.textStyleOrangeBold20,
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
