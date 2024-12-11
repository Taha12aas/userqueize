import 'package:flutter/material.dart';
import 'package:userqueize/Mobile/views/create_subject_questions_view.dart';
import 'package:userqueize/Mobile/views/generated_questions_view.dart';
import 'package:userqueize/Mobile/views/home_view.dart';
import 'package:userqueize/Mobile/views/log_in_view.dart';
import 'package:userqueize/Mobile/views/subjects_view.dart';
import 'package:userqueize/Mobile/views/teacher_subjects_view.dart';
import 'package:userqueize/Mobile/views/create_questions_view.dart';
import 'package:userqueize/utils/constants.dart';

void main(List<String> args) {
  runApp(const UserQueize());
}

class UserQueize extends StatelessWidget {
  const UserQueize({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomeView.id: (context) => const HomeView(),
        LogInView.id: (context) => const LogInView(),
        SubjectsView.id: (context) => const SubjectsView(),
        TeacherSubjects.id: (context) => const TeacherSubjects(),
        CreateQuestionsView.id: (context) => const CreateQuestionsView(),
        GeneratedQuestionsView.id: (context) => const GeneratedQuestionsView(),
        CreateSubjectQuestionsView.id: (context) =>
            const CreateSubjectQuestionsView()
      },
      theme:
          ThemeData(scaffoldBackgroundColor: kBackGround, fontFamily: 'Exo2'),
      debugShowCheckedModeBanner: false,
      initialRoute: LogInView.id,
    );
  }
}
