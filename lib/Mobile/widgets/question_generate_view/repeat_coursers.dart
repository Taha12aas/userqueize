import 'package:flutter/material.dart';
import 'package:userqueize/Mobile/widgets/question_generate_view/counter_column.dart';

class RepeatCoursers extends StatelessWidget {
  const RepeatCoursers({
    super.key,
    required this.frequentlyQuestionsCount,
    required this.title,
  });

  final ValueNotifier<int> frequentlyQuestionsCount;
  final String title;
  @override
  Widget build(BuildContext context) {
    return CounterColumn(
      minValue: 0,
      valueNotifier: frequentlyQuestionsCount,
      maxValue: 28,
      title: title,
      counterValue: 2,
    );
  }
}
