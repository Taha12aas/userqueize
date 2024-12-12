import 'package:flutter/material.dart';
import 'package:userqueize/Mobile/views/add_question.dart';
import 'package:userqueize/Mobile/views/home_view.dart';
import 'package:userqueize/Mobile/widgets/CreateSubjectQuestionsView/question_and_answer.dart';
import 'package:userqueize/utils/constants.dart';
import 'package:userqueize/utils/custom_app_bar.dart';

class CreateSubjectQuestionsView extends StatelessWidget {
  const CreateSubjectQuestionsView({super.key});
  static String id = 'CreateSubjectQuestionsView';

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> data = [
      {
        'question':
            'ما هو الحاسوب الذي يستخدم لتطوير البرمجيات وإنجاز المشاريع البرمجية؟',
        'answers': ['حاسوب مكتبي', 'حاسوب محمول', 'حاسوب لوحي', 'حاسوب ذكي'],
        'correctAnswer': 'حاسوب مكتبي'
      },
      {
        'question':
            'ما هو الحاسوب الذي يستخدم لتطوير البرمجيات وإنجاز المشاريع البرمجية؟',
        'answers': ['حاسوب مكتبي', 'حاسوب محمول', 'حاسوب لوحي', 'حاسوب ذكي'],
        'correctAnswer': 'حاسوب مكتبي'
      },
      {
        'question':
            'ما هو الحاسوب الذي يستخدم لتطوير البرمجيات وإنجاز المشاريع البرمجية؟',
        'answers': ['حاسوب مكتبي', 'حاسوب محمول', 'حاسوب لوحي', 'حاسوب ذكي'],
        'correctAnswer': 'حاسوب مكتبي'
      },
      {
        'question':
            'ما هو الحاسوب الذي يستخدم لتطوير البرمجيات وإنجاز المشاريع البرمجية؟',
        'answers': ['حاسوب مكتبي', 'حاسوب محمول', 'حاسوب لوحي', 'حاسوب ذكي'],
        'correctAnswer': 'حاسوب مكتبي'
      },
    ];

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: kOrangeBlackColor,
        child: const Icon(
          Icons.add,
          color: kOrangeColor,
        ),
        onPressed: () {
          Navigator.pushNamed(context, AddQuestion.id);
        },
      ),
      appBar: customAppBar('الأسئلة المولدة', context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            QuestionAndAnswer(data: data),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  HomeView.id,
                  (route) => false,
                );
              },
              icon: const Icon(Icons.save),
              label: const Text('حفظ'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
