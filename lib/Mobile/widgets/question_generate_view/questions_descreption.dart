import 'package:flutter/material.dart';
import 'package:userqueize/Mobile/widgets/question_generate_view/counter_column.dart';

class QuestionsDescreption extends StatelessWidget {
  const QuestionsDescreption({
    super.key,
    required this.trueOrFalseCount,
    required this.answersCount,
    required this.qustionsCount,
  });

  final ValueNotifier<int> trueOrFalseCount;
  final ValueNotifier<int> answersCount;
  final ValueNotifier<int> qustionsCount;

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
              valueNotifier: trueOrFalseCount,
              title: ': الصح والخطأ',
              counterValue: 1,
              maxValue: 29,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: CounterColumn(
              minValue: 2,
              valueNotifier: answersCount,
              maxValue: 3,
              title: ': الخيارات',
              counterValue: 1,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: CounterColumn(
              minValue: 5,
              valueNotifier: qustionsCount,
              maxValue: 55,
              title: ': الاسئلة',
              counterValue: 5,
            ),
          ),
        ],
      ),
    );
  }
}
