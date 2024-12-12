import 'package:flutter/material.dart';
import 'package:userqueize/Mobile/views/add_question.dart';
import 'package:userqueize/Mobile/views/home_view.dart';
import 'package:userqueize/utils/constants.dart';
import 'package:userqueize/utils/custom_app_bar.dart';
import 'package:userqueize/utils/font_style.dart';
import 'package:userqueize/utils/responsive_text.dart';

class CreateSubjectQuestionsView extends StatelessWidget {
  const CreateSubjectQuestionsView({super.key});
  static String id = 'CreateSubjectQuestionsView';

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> data = [
      {
        'question':
            'ما هو الحاسوب الذي يستخدم لتطوير البرمجيات وإنجاز المشاريع البرمجية؟',
        'answers': ['حاسوب مكتبي', 'حاسوب محمول', 'حاسوب لوحي', 'حاسوب ذكي'],
        'correctAnswer': 'حاسوب مكتبي'
      },
      {
        'question':
            'ما هو الحاسوب الذي يستخدم لتطوير البرمجيات وإنجاز المشاريع البرمجية؟',
        'answers': ['حاسوب مكتبي', 'حاسوب محمول', 'حاسوب لوحي', 'حاسوب ذكي'],
        'correctAnswer': 'حاسوب مكتبي'
      },
      {
        'question':
            'ما هو الحاسوب الذي يستخدم لتطوير البرمجيات وإنجاز المشاريع البرمجية؟',
        'answers': ['حاسوب مكتبي', 'حاسوب محمول', 'حاسوب لوحي', 'حاسوب ذكي'],
        'correctAnswer': 'حاسوب مكتبي'
      },
      {
        'question':
            'ما هو الحاسوب الذي يستخدم لتطوير البرمجيات وإنجاز المشاريع البرمجية؟',
        'answers': ['حاسوب مكتبي', 'حاسوب محمول', 'حاسوب لوحي', 'حاسوب ذكي'],
        'correctAnswer': 'حاسوب مكتبي'
      },
    ];

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: kOrangeBlackColor,
        child: const Icon(
          Icons.add,
          color: kOrangeColor,
        ),
        onPressed: () {
          Navigator.pushNamed(context, AddQuestion.id);
        },
      ),
      appBar: customAppBar('الأسئلة المولدة', context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: data.length,
              itemBuilder: (context, index) {
                final questionData = data[index];

                final isOrangeBackground = index % 2 != 0;

                return Card(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
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
                                style:
                                    FontStyleApp.textStyleOrangeBold15.copyWith(
                                  color: isOrangeBackground
                                      ? Colors.white
                                      : Colors.black,
                                ),
                                textAlign: TextAlign.right,
                                softWrap: true,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              '- ${index + 1}',
                              style:
                                  FontStyleApp.textStyleOrangeBold15.copyWith(
                                color: isOrangeBackground
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children:
                              questionData['answers'].map<Widget>((answer) {
                            return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4.0),
                                child: Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: answer ==
                                              questionData['correctAnswer']
                                          ? kOrangeColor
                                          : Colors.black54,
                                      borderRadius: BorderRadius.circular(18)),
                                  child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          questionData['correctAnswer'],
                                          style: FontStyleApp
                                              .textStyleOrangeBold15
                                              .copyWith(
                                            color: Colors.white,
                                            fontSize:
                                                getResponsiveText(context, 15),
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
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  HomeView.id,
                  (route) => false,
                );
              },
              icon: const Icon(Icons.save),
              label: const Text('حفظ'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
