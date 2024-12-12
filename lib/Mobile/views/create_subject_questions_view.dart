import 'package:flutter/material.dart';
import 'package:userqueize/utils/constants.dart';
import 'package:userqueize/utils/custom_app_bar.dart';
import 'package:userqueize/utils/font_style.dart';

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
      {
        'question': 'ما هو الممر الذي يربط بين طابقين في المنزل؟',
        'answers': ['سلم', 'مصعد', 'ممشى', 'جسر'],
        'correctAnswer': 'سلم'
      },
      {
        'question': 'جهاز ذكي يُستخدم يومياً في الاتصالات والتواصل الاجتماعي؟',
        'answers': ['هاتف ذكي', 'ساعة ذكية', 'حاسوب', 'جهاز لوحي'],
        'correctAnswer': 'هاتف ذكي'
      },
    ];

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {},
      ),
      appBar: customAppBar('الأسئلة المولدة', context),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                  color: isOrangeBackground ? kOrangeColor : Colors.white,
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
                                style: FontStyleApp.textStyleOrange15.copyWith(
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
                              style: FontStyleApp.textStyleOrange15.copyWith(
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
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      answer == questionData['correctAnswer']
                                          ? Colors.grey[900]
                                          : Colors.grey[300],
                                  foregroundColor: Colors.black,
                                ),
                                onPressed: () {
                                  print('Selected: $answer');
                                },
                                child: Text(
                                  answer,
                                  style: FontStyleApp.textStyleOrange15,
                                  textAlign: TextAlign.center,
                                  softWrap: true,
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              print(
                                  'Deleted question: ${questionData['question']}');
                            },
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
                print('Downloading data...');
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
