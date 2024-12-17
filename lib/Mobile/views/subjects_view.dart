import 'package:flutter/material.dart';
import 'package:userqueize/Mobile/widgets/teachers_view_and_subjects_view/list_view_buttin_class.dart';
import 'package:userqueize/Mobile/widgets/teachers_view_and_subjects_view/list_view_card_subjects.dart';
import 'package:userqueize/Mobile/widgets/teachers_view_and_subjects_view/teacher_profile_card.dart';
import 'package:userqueize/utils/custom_app_bar.dart';
import 'package:userqueize/utils/font_style.dart';
import 'package:userqueize/utils/responsive_text.dart';

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
            Text(
              ' : تصنيف حسب الصفوف ',
              style: FontStyleApp.textStyleOrangeBold20
                  .copyWith(fontSize: getResponsiveText(context, 20)),
            ),
            const ListViewButtonClass(
              listClass: []
            ),
            const SizedBox(
              height: 20,
            ),
            const Expanded(child: ListViewCardSubjects(listSubject: [], listClasses: [],))
          ],
        ),
      ),
    );
  }
}
