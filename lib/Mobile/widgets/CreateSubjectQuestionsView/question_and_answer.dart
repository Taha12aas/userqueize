import 'package:flutter/material.dart';
import 'package:userqueize/utils/font_style.dart';

class QuestionAndAnswer extends StatelessWidget {
  const QuestionAndAnswer({
    super.key,
    required this.data,
  });

  final List<Map<String, dynamic>> data;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: data.length,
      itemBuilder: (context, index) {
        final questionData = data[index];
        final isEven = index % 2 == 0;

        return Card(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          color: isEven ? const Color(0xFFF1F1F1) : const Color(0xFFE8E9E6),
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Flexible(
                      child: Text(
                        questionData['question'],
                        style: FontStyleApp.blackBold16,
                        textAlign: TextAlign.right,
                        softWrap: true,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '- ${index + 1}',
                      style: FontStyleApp.blackBold16,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: questionData['answers'].map<Widget>((answer) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                          color: answer == questionData['correctAnswer']
                              ? const Color(0xFFFF7100)
                              : const Color(0xFFB0B0B0),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              answer,
                              style: FontStyleApp.blackBold16,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    icon: const Icon(
                      Icons.delete,
                      color: Color(0xFFEE4B2B),
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
