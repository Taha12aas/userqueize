import 'package:flutter/material.dart';
import 'package:userqueize/Mobile/widgets/question_generate_view/counter_column.dart';

class QuestionsLevel extends StatelessWidget {
  const QuestionsLevel({
    super.key,
    required this.hard,
    required this.normal,
    required this.easy,
  });

  final ValueNotifier<int> hard;
  final ValueNotifier<int> normal;
  final ValueNotifier<int> easy;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: CounterColumn(
              minValue: 0,
              valueNotifier: hard,
              title: 'صعبة',
              counterValue: 1,
              maxValue: 60,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: CounterColumn(
              minValue: 0,
              valueNotifier: normal,
              maxValue: 60,
              title: 'متوسطة',
              counterValue: 1,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: CounterColumn(
              minValue: 0,
              valueNotifier: easy,
              maxValue: 60,
              title: 'سهلة',
              counterValue: 1,
            ),
          ),
        ],
      ),
    );
  }
}
