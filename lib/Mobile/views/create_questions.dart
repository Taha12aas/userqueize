import 'package:flutter/material.dart';
import 'package:userqueize/Mobile/views/create_subject_questions.dart';
import 'package:userqueize/Mobile/widgets/teachers_view_and_subjects_view/card_subjects.dart';
import 'package:userqueize/Mobile/widgets/teachers_view_and_subjects_view/list_view_buttin_class.dart';
import 'package:userqueize/utils/custom_app_bar.dart';
import 'package:userqueize/utils/font_style.dart';

class TeachersView extends StatelessWidget {
  const TeachersView({super.key});
  static String id = 'TeachersView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('أنشاء اسئلة'),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Text(
              ' : تصنيف حسب الصفوف ',
              style: FontStyleApp.textStyleOrangeBold25,
            ),
            const ListViewButtonClass(),
            const SizedBox(
              height: 15,
            ),
            CardSubjects(
              subject: 'رياضات',
              teacherImag: 'assets/images/Teachers.png',
              onTap: () {
                Navigator.pushNamed(context, CreateSubjectQuestions.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
