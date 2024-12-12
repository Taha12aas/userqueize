import 'package:flutter/material.dart';
import 'package:userqueize/Mobile/widgets/generated_question.dart/year_questions.dart';

class QuestionsList extends StatefulWidget {
  const QuestionsList({super.key});

  @override
  State<QuestionsList> createState() => _QuestionsListState();
}

class _QuestionsListState extends State<QuestionsList> {
  List<bool> values = List<bool>.generate(30, (index) => false);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 30,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: YearQuestions(
            year: 'دورة 2020',
            value: values[index],
            onChanged: (newValue) {
              setState(
                () {
                  values[index] = newValue;
                },
              );
            },
          ),
        );
      },
    );
  }
}
