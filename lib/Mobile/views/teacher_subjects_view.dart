import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userqueize/Mobile/widgets/teachers_view_and_subjects_view/list_view_card_subjects.dart';
import 'package:userqueize/Mobile/widgets/teachers_view_and_subjects_view/teacher_profile_card.dart';
import 'package:userqueize/cubits/cubitTeacher/cubit_teacher.dart';
import 'package:userqueize/cubits/cubitTeacher/ques_app_status.dart';
import 'package:userqueize/utils/custom_app_bar.dart';

class TeacherSubjects extends StatelessWidget {
  const TeacherSubjects({super.key});
  static String id = 'TeacherSubjects';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('مواد المدرس', context),
      body:  Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           BlocBuilder<CubitTeacher, QuesAppStatus>(
                builder: (context, state) {
                  if (state is SuccessState) {
                    return TeacherProfileCard(
                      text: state.user!.name,
                      image: state.user!.photo,
                    );
                  } else {
                    return const TeacherProfileCard(
                      text: "يوجد حطا",
                      image: 'assets/images/TeachersTaha.jpg',
                    );
                  }
                },
              ),
            const SizedBox(
              height: 20,
            ),
            const Expanded(
              child: ListViewCardSubjects(listSubject: [], listClasses: [],),
            )
          ],
        ),
      ),
    );
  }
}
