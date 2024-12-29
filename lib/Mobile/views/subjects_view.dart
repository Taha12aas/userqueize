import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userqueize/Mobile/widgets/home_view/list_view_item_card_subject.dart';
import 'package:userqueize/Mobile/widgets/teachers_view_and_subjects_view/teacher_profile_card.dart';
import 'package:userqueize/cubits/cubitTeacher/cubit_teacher.dart';
import 'package:userqueize/cubits/cubitTeacher/ques_app_status.dart';
import 'package:userqueize/utils/custom_app_bar.dart';

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
            Align(
              alignment: Alignment.center,
              child: BlocBuilder<CubitTeacher, QuesAppStatus>(
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
            ),
            const SizedBox(
              height: 20,
            ),
            const ListViewItemCardSubject()
          ],
        ),
      ),
    );
  }
}
