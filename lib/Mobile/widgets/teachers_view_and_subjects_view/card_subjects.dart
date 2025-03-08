import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:userqueize/Mobile/widgets/teachers_view_and_subjects_view/row_home_view.dart';
import 'package:userqueize/cubits/cubitTeacher/cubit_teacher.dart';
import 'package:userqueize/utils/constants.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:docx_template/docx_template.dart';

class CardSubjects extends StatelessWidget {
  const CardSubjects({
    super.key,
    required this.onTap,
    required this.subject,
    required this.classTeacher,
    required this.courseDate,
    required this.seasonSubject,
  });

  final void Function() onTap;
  final String subject;
  final String classTeacher;
  final String courseDate;
  final String seasonSubject;

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Bounceable(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: screenHeight * 0.12,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 5.0,
              offset: const Offset(3, 3),
            ),
          ],
          border: Border.all(
            color: kOrangeBlackColor,
            width: 0.5,
          ),
          borderRadius: BorderRadius.circular(12),
          color: kAshen,
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            CubitTeacher.user.printingPermission
                ? IconButton(
                    color: const Color.fromARGB(255, 209, 92, 8),
                    iconSize: 30,
                    onPressed: () {
                      void generateWordFile() async {
                        // البيانات الأصلية

                        final data = [
                          {
                            "answers": [
                              "السرية والتكاملية",
                              "عدم الاهتمام بالمعلومات"
                            ],
                            "question": "ما هي الغاية من حماية المعلومات؟"
                          },
                          {
                            "answers": ["نعم", "لا"],
                            "question":
                                "هل يمكن استخدام طرف ثالث موثوق به لمنع الإنكار؟"
                          },
                          {
                            "answers": ["نعم", "لا"],
                            "question":
                                "هل يجب أن تتوفر المعلومات للجهات المصرح لها فقط؟"
                          },
                          {
                            "answers": ["نعم", "لا"],
                            "question":
                                "هل يمكن تحليل حركة البيانات حتى مع استخدام التشفير؟"
                          },
                          {
                            "answers": ["صح", "خطأ"],
                            "question":
                                "تعتبر المعلومات غير المتاحة مفيدة لأحد؟"
                          },
                        ];

                        // إنشاء ملف Word
                        final template = await DocxTemplate.fromBytes(
                            File('template.docx').readAsBytesSync());

                        // النصوص المدخلة
                        Content c = Content();
                        for (var item in data) {
                          c.add(TextContent('question', item['question']));
                          c.add(ListContent(
                              'answers', item['answers'] as List<Content>));
                        }

                        // مسار الحفظ
                        final outputDir =
                            await getApplicationDocumentsDirectory();
                        final filePath = '${outputDir.path}/questions.docx';

                        final d = await template.generate(c);
                        if (d != null) {
                          final of = File(filePath);
                          await of.writeAsBytes(d);
                          log('File saved to $filePath');
                        }
                      }
                    },
                    icon: const Icon(
                      Icons.download,
                    ),
                  )
                : const SizedBox(),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RowText(
                    classAndSubject: courseDate,
                    screenWidth: screenWidth,
                    subjectName: ' : دورة ',
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  RowText(
                    classAndSubject: seasonSubject,
                    screenWidth: screenWidth,
                    subjectName: ': فصل',
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RowText(
                    classAndSubject: subject,
                    screenWidth: screenWidth,
                    subjectName: ' : اسم المادة',
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  RowText(
                    classAndSubject: classTeacher,
                    screenWidth: screenWidth,
                    subjectName: ': صف',
                  ),
                ],
              ),
            ),
            SizedBox(width: screenWidth * 0.02),
          ],
        ),
      ),
    );
  }
}
