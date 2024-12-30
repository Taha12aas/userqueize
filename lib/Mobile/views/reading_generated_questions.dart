import 'package:flutter/material.dart';
import 'package:userqueize/Mobile/widgets/CreateSubjectQuestionsView/question_and_answer.dart';
import 'package:userqueize/cubits/cubitSubject/cubit_subject.dart';
import 'package:userqueize/utils/custom_app_bar.dart';

class ReadingGeneratedQuestions extends StatefulWidget {
  const ReadingGeneratedQuestions({super.key});
  static String id = 'ReadingGeneratedQuestions';
  @override
  State<ReadingGeneratedQuestions> createState() =>
      _ReadingGeneratedQuestionsState();
}

class _ReadingGeneratedQuestionsState extends State<ReadingGeneratedQuestions> {

  @override
  Widget build(BuildContext context) {
    List subjectInfo = ModalRoute.of(context)!.settings.arguments as List;
    List<dynamic> course = [];
    for (var i = 0; i < CubitSubject.subjectsCount.length; i++) {
      if (subjectInfo[0] == CubitSubject.subjectsCount[i].nameSubject &&
          subjectInfo[1] == CubitSubject.subjectsCount[i].classSabject &&
          subjectInfo[2] == CubitSubject.subjectsCount[i].coursesDate &&
          subjectInfo[3] == CubitSubject.subjectsCount[i].seasonSubject) {
        course.addAll(CubitSubject.subjectsCount[i].courses);
      }
    }
    return Scaffold(
      appBar: customAppBar(subjectInfo[0], context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            QuestionAndAnswer(
              data: course,
              isIcon: false,
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
