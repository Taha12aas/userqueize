import 'package:flutter/material.dart';
import 'package:userqueize/Mobile/widgets/CreateSubjectQuestionsView/question_and_answer.dart';
import 'package:userqueize/cubits/cubitPreLoadedCourse/cubit_pre_loaded_course.dart';
import 'package:userqueize/utils/custom_app_bar.dart';

class ReadingPreLoadedCoursesView extends StatefulWidget {
  const ReadingPreLoadedCoursesView({super.key});
  static String id = 'ReadingPreLoadedCoursesView';
  @override
  State<ReadingPreLoadedCoursesView> createState() =>
      _ReadingPreLoadedCoursesView();
}

class _ReadingPreLoadedCoursesView extends State<ReadingPreLoadedCoursesView> {
  @override
  Widget build(BuildContext context) {
    List subjectInfo = ModalRoute.of(context)!.settings.arguments as List;
    List<dynamic> course = [];
    for (var i = 0; i < CubitPreLoadedCourse.courses.length; i++) {
      if (subjectInfo[0] == CubitPreLoadedCourse.courses[i].courseHistory &&
          subjectInfo[1] == CubitPreLoadedCourse.courses[i].season &&
          subjectInfo[2] == CubitPreLoadedCourse.courses[i].subjectName &&
          subjectInfo[3] == CubitPreLoadedCourse.courses[i].subjectClass) {
        course.addAll(CubitPreLoadedCourse.courses[i].courses);
      }
    }
    return Scaffold(
      appBar: customAppBar(subjectInfo[2], context),
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
