import 'package:flutter/material.dart';
import 'package:userqueize/utils/custom_app_bar.dart';

class CreateSubjectQuestionsView extends StatelessWidget {
  const CreateSubjectQuestionsView({super.key});
  static String id = 'CreateSubjectQuestions';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('انشاء اسئلة (رياضيات)'),
      body: const Column(),
    );
  }
}
