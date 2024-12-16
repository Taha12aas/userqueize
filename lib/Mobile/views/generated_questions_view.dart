import 'package:flutter/material.dart';
import 'package:userqueize/Mobile/widgets/generated_question.dart/custom_button_class.dart';
import 'package:userqueize/Mobile/widgets/generated_question.dart/questions_list.dart';
import 'package:userqueize/Mobile/widgets/teachers_view_and_subjects_view/teacher_profile_card.dart';
import 'package:userqueize/utils/custom_app_bar.dart';

class GeneratedQuestionsView extends StatelessWidget {
  const GeneratedQuestionsView({super.key});
  static String id = 'GeneratedSubject';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('رياضيات',context),
      body: const Padding(
        padding: EdgeInsets.all(18),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TeacherProfileCard(),
              Padding(
                padding: EdgeInsets.only(top: 27),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomButtonClass(title: 'تكميلي',),
                    CustomButtonClass(title: 'فصل ثاني'),
                    CustomButtonClass(title: 'فصل اول')
                  ],
                ),
              ),
              SizedBox(height: 15),
              Expanded(
                child: QuestionsList(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
