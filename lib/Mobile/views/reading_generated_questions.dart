import 'package:flutter/material.dart';
import 'package:userqueize/Mobile/widgets/CreateSubjectQuestionsView/question_and_answer.dart';
import 'package:userqueize/utils/custom_app_bar.dart';

class ReadingGeneratedQuestions extends StatefulWidget {
  const ReadingGeneratedQuestions({super.key});
  static String id = 'ReadingGeneratedQuestions';
  @override
  State<ReadingGeneratedQuestions> createState() =>
      _ReadingGeneratedQuestionsState();
}

class _ReadingGeneratedQuestionsState extends State<ReadingGeneratedQuestions> {
  List<dynamic> fullQuestionText = [
    {
      "question": "ما هو الذكاء الاصطناعي؟",
      "answers": [
        "القدرات الذهنية البشرية",
        "الذكاء الذي تبديه الآلات",
        "أنماط العمل الحاسوبي",
        "الآلات الذكية"
      ]
    },
    {
      "question": "من هو الباحث الذي وضع مصطلح الذكاء الاصطناعي؟",
      "answers": [
        "جون مكارثي",
        "إلنور أوستروم",
        "إدجار كود",
        "هنري فوكس تالبوت"
      ]
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('الأسئلة المولدة', context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            QuestionAndAnswer(data: fullQuestionText,isIcon: false,),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
