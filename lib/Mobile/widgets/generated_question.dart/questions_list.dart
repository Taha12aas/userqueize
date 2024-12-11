import 'package:flutter/material.dart';
import 'package:userqueize/Mobile/widgets/generated_question.dart/year_questions.dart';

class QuestionsList extends StatelessWidget {
  const QuestionsList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 15,
      itemBuilder: (context, index) {
        return const Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: YearQuestions(year: 'دورة 2020'),
        );
      },
    );
  }
}
