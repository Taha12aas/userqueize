import 'package:flutter/material.dart';
import 'package:userqueize/utils/constants.dart';
import 'package:userqueize/utils/font_style.dart';
import 'package:userqueize/utils/responsive_text.dart';

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

        final isOrangeBackground = index % 2 != 0;

        return Card(
          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          color: isOrangeBackground ? kAshenColor : Colors.white,
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
                        style: FontStyleApp.textStyleOrangeBold15.copyWith(
                          color:
                              isOrangeBackground ? Colors.white : Colors.black,
                        ),
                        textAlign: TextAlign.right,
                        softWrap: true,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '- ${index + 1}',
                      style: FontStyleApp.textStyleOrangeBold15.copyWith(
                        color: isOrangeBackground ? Colors.white : Colors.black,
                      ),
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
                          height: 40,
                          decoration: BoxDecoration(
                              color: answer == questionData['correctAnswer']
                                  ? kOrangeColor
                                  : Colors.black54,
                              borderRadius: BorderRadius.circular(18)),
                          child: Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  questionData['correctAnswer'],
                                  style: FontStyleApp.textStyleOrangeBold15
                                      .copyWith(
                                    color: Colors.white,
                                    fontSize: getResponsiveText(context, 15),
                                  ),
                                ),
                              )),
                        ));
                  }).toList(),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
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
