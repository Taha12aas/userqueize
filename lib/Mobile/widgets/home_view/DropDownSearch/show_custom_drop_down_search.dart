import 'package:flutter/material.dart';
import 'package:userqueize/Mobile/views/generated_questions_view.dart';
import 'package:userqueize/Mobile/widgets/log_in_view/auth_text_field.dart';
import 'package:userqueize/Mobile/widgets/home_view/DropDownSearch/teacher_card_drop_down_search_item.dart';
import 'package:userqueize/utils/constants.dart';
import 'package:userqueize/utils/font_style.dart';
import 'package:userqueize/utils/responsive_text.dart';

void showCustomDropDownSearch(BuildContext context) {
  showModalBottomSheet(
    scrollControlDisabledMaxHeightRatio: 900,
    backgroundColor: kBackGround,
    context: context,
    shape: const RoundedRectangleBorder(
      side: BorderSide(color: kOrangeColor),
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(20.0),
      ),
    ),
    builder: (BuildContext context) {
      return Directionality(
        textDirection: TextDirection.rtl,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'ابحث عن مادة',
                style: FontStyleApp.textStyleOrange18
                    .copyWith(fontSize: getResponsiveText(context, 18)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: AuthTextField(
                  validator: (p0) {}, hintText: 'ابحث', iconData: Icons.search),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
              child: SizedBox(
                height: 500,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: 100,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TeacherCardDropDownSearchItem(
                          subject: 'علوم',
                          teacherImag: 'assets/images/subject.png',
                          onTap: () {
                            Navigator.pushNamed(
                                context, GeneratedQuestionsView.id);
                          },
                          classTeacher: 'صف اول',
                        ),
                      ),
                    );
                  },
                  itemCount: 10,
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}
