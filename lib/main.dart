import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
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
import 'package:userqueize/cubits/cubitSubject/cubit_Subject.dart';
import 'package:userqueize/cubits/cubitTeacher/cubit_teacher.dart';
import 'package:userqueize/models/Question.dart';
import 'package:userqueize/utils/constants.dart';

void main() async {
  String fullQuestionText = '''
8. ما هي أحد التحدsيات التي يواجهها مجال الذكاء الصناعي؟

A) تحسين جودة الحياة
B) توفير فرص عمل جديدة
C) قضايا الخصوصية والأمان
D) زيادة الاستهلاك الطاقة
''';
  Question question = Question.parseFromText(fullQuestionText);

  log("السؤال: ${question.questionText}");
  log("الخيارات:");
  for (var option in question.options) {
    log(option);
  }
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://gewushokramjbiqcbpng.supabase.co', // URL الخاص بكs
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Imdld3VzaG9rcmFtamJpcWNicG5nIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQwNjQ1MjksImV4cCI6MjA0OTY0MDUyOX0.9v7QMV8NgGhSgBnGRqZKxr2GNSLY1dZcgvm-ioIkdXg', // مفتاح الوصول العام (مفتاح API)
  );

  // TeacherService.sendVerificationCode(963988818024);
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => CubitTeacher(),
      ),
      BlocProvider(
        create: (context) => CubitSubject(),
      ),
    ],
    child: MaterialApp(
      routes: {
        LogInView.id: (context) => const LogInView(),
        HomeView.id: (context) => const HomeView(),
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
    ),
  ));
}
