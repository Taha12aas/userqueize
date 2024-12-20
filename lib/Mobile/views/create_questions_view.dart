import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userqueize/Mobile/widgets/teachers_view_and_subjects_view/list_view_card_subjects.dart';
import 'package:userqueize/cubits/ques_app_status.dart';
import 'package:userqueize/cubits/cubitTeacher/cubit_teacher.dart';
import 'package:userqueize/utils/custom_app_bar.dart';

class CreateQuestionsView extends StatelessWidget {
  const CreateQuestionsView({super.key});
  static String id = 'CreateQuestionsView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('أختيار مادة', context),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: BlocBuilder<CubitTeacher, QuesAppStatus>(
          builder: (context, state) {
            if (state is SuccessState) {
              List<dynamic> classes = state.user!.classesSubjects['صف'];
              List<dynamic> subjects = state.user!.classesSubjects['مواد'];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const SizedBox(
                    height: 15,
                  ),
                  Expanded(
                      child: ListViewCardSubjects(
                    listClasses: classes,
                    listSubject: subjects,
                  ))
                ],
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
