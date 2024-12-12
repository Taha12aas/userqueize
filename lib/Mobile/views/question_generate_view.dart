import 'package:flutter/material.dart';
import 'package:userqueize/utils/custom_app_bar.dart';

class QuestionGenerateView extends StatelessWidget {
  const QuestionGenerateView({super.key});
    static String id = 'QuestionGenerateView';

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: customAppBar('انشاء اسئلة', context),
    );
  }
}