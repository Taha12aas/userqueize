import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:userqueize/Mobile/views/add_question.dart';
import 'package:userqueize/Mobile/views/home_view.dart';
import 'package:userqueize/Mobile/widgets/CreateSubjectQuestionsView/question_and_answer.dart';
import 'package:userqueize/cubits/cubitSubject/cubit_subject.dart';
import 'package:userqueize/models/question.dart';
import 'package:userqueize/utils/constants.dart';
import 'package:userqueize/utils/custom_app_bar.dart';

class CreateSubjectQuestionsView extends StatelessWidget {
  const CreateSubjectQuestionsView({super.key});
  static String id = 'CreateSubjectQuestionsView';

  @override
  Widget build(BuildContext context) {
    String fullQuestionText = '';
    fullQuestionText = CubitSubject.subjectsCount[1].courses;
    Question question = Question.parseFromText(fullQuestionText);

    List<Map<String, dynamic>> test = [];
    final List<Map<String, dynamic>> data = [
      {
        'question': question.questionText,
        'answers': question.options,
      },
      for (var i = 0; i < question.questionText.length; i++) {}
    ];
    for (var i = 0; i < data.length; i++) {
      test.add(data[i]);
    }
    log(data.toString());
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



// [
//   {
//     "question": "ما هو الذكاء الاصطناعي؟",
//     "answers": ["القدرات الذهنية البشرية", "الذكاء الذي تبديه الآلات", "أنماط العمل الحاسوبي", "الآلات الذكية"]
//   },
//   {
//     "question": "من هو الباحث الذي وضع مصطلح الذكاء الاصطناعي؟",
//     "answers": ["جون مكارثي", "إلنور أوستروم", "إدجار كود", "هنري فوكس تالبوت"]
//   },
//   {
//     "question": "ما هو التقنية التي تعتمد على شبكات عصبية صناعية تحاكي الدماغ البشري؟",
//     "answers": ["التعلم العميق", "معالجة اللغة الطبيعية", "الرؤية الحاسوبية", "التعلم الموجّه"]
//   },
//   {
//     "question": "ما هي أحد مظاهر الذكاء الاصطناعي الحديثة؟",
//     "answers": ["التعلم العميق", "الحوسبة السحابية", "الروبوتات الصناعية", "أنظمة المحاكاة"]
//   },
//   {
//     "question": "ما هي قدرات تقنية التعلم العميق؟",
//     "answers": ["التعرف على الصور", "إنشاء الروبوتات", "الحوسبة السحابية", "المحاكاة البيئية"]
//   },
//   {
//     "question": "أين تستثمر الشركات في وادي السيليكون في الذكاء الاصطناعي؟",
//     "answers": ["فيسبوك وغوغل", "آبل وأمازون", "مايكروسوفت وسامسونغ", "إنفيديا وAMD"]
//   },
//   {
//     "question": "ما هو المجال الأكاديمي الذي يهتم بصنع حواسيب وبرامج قادرة على اتخاذ سلوك ذكي؟",
//     "answers": ["الذكاء الاصطناعي", "علم الروبوتات", "علم البيانات", "الهندسة الحيوية"]
//   },
//   {
//     "question": "ما هو الاستخدام الشائع لمصطلح الذكاء الاصطناعي اليوم؟",
//     "answers": ["تشغيل الأجهزة المنزلية", "التحكم في الطائرات", "محاكاة الذكاء البشري", "التفاعل مع البشر"]
//   },
//   {
//     "question": "ما هي الشركات التي تهتم بتحذيرات تطور الذكاء الاصطناعي؟",
//     "answers": ["فيسبوك وغوغل", "آبل وأمازون", "مايكروسوفت وسامسونغ", "أدوبي وسوني"]
//   },
//   {
//     "question": "ما هو أحد التعريفات الأكاديمية للذكاء الاصطناعي؟",
//     "answers": ["دراسة وتصميم أنظمة ذكية", "إنشاء برامج محاكاة", "تحليل البيانات البيئية", "تصنيع الروبوتات"]
//   }
// ]
