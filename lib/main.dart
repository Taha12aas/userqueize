import 'package:flutter/material.dart';
import 'package:userqueize/Mobile/views/add_question.dart';
import 'package:userqueize/Mobile/views/change_password_view.dart';
import 'package:userqueize/Mobile/views/create_questions_view.dart';
import 'package:userqueize/Mobile/views/create_subject_questions_view.dart';
import 'package:userqueize/Mobile/views/generated_questions_view.dart';
import 'package:userqueize/Mobile/views/home_view.dart';
import 'package:userqueize/Mobile/views/log_in_view.dart';
import 'package:userqueize/Mobile/views/question_generate_view.dart';
import 'package:userqueize/Mobile/views/subjects_view.dart';
import 'package:userqueize/Mobile/views/teacher_profile_view.dart';
import 'package:userqueize/Mobile/views/teacher_subjects_view.dart';
import 'package:userqueize/utils/constants.dart';

void main(List<String> args) {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        HomeView.id: (context) => const HomeView(),
        LogInView.id: (context) => const LogInView(),
        SubjectsView.id: (context) => const SubjectsView(),
        TeacherSubjects.id: (context) => const TeacherSubjects(),
        GeneratedQuestionsView.id: (context) => const GeneratedQuestionsView(),
        TeacherProfileView.id: (context) => const TeacherProfileView(),
        ChangePasswordView.id: (context) => const ChangePasswordView(),
        CreateQuestionsView.id: (context) => const CreateQuestionsView(),
        CreateSubjectQuestionsView.id: (context) =>
            const CreateSubjectQuestionsView(),
        QuestionGenerateView.id: (context) => const QuestionGenerateView(),
        AddQuestion.id: (context) => const AddQuestion(),
      },
      theme:
          ThemeData(scaffoldBackgroundColor: kBackGround, fontFamily: 'Exo2'),
      debugShowCheckedModeBanner: false,
      initialRoute: LogInView.id,
    );
  }
}
