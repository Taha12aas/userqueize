import 'package:flutter/material.dart';
import 'package:userqueize/Mobile/views/question_generate_view.dart';
import 'package:userqueize/Mobile/widgets/teachers_view_and_subjects_view/card_subjects.dart';
import 'package:userqueize/Mobile/widgets/teachers_view_and_subjects_view/list_view_buttin_class.dart';
import 'package:userqueize/utils/custom_app_bar.dart';
import 'package:userqueize/utils/font_style.dart';
import 'package:userqueize/utils/responsive_text.dart';

class CreateQuestionsView extends StatelessWidget {
  const CreateQuestionsView({super.key});
  static String id = 'CreateQuestionsView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('أختيار مادة', context),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              ' : تصنيف حسب الصفوف ',
              style: FontStyleApp.textStyleOrangeBold20
                  .copyWith(fontSize: getResponsiveText(context, 20)),
            ),
            const ListViewButtonClass(),
            const SizedBox(
              height: 15,
            ),
            CardSubjects(
              subject: 'رياضات',
              teacherImag: 'assets/images/Teachers.png',
              onTap: () {
                Navigator.pushNamed(context, QuestionGenerateView.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
