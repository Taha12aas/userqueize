import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:userqueize/Mobile/views/reading_generated_questions.dart';
import 'package:userqueize/Mobile/widgets/teachers_view_and_subjects_view/card_subjects.dart';
import 'package:userqueize/cubits/cubitSubject/cubit_subject.dart';
import 'package:userqueize/cubits/cubitSubject/cubit_subject_status.dart';
import 'package:userqueize/utils/font_style.dart';
import 'package:pdf/widgets.dart' as pw;

class ListViewItemCardSubject extends StatelessWidget {
  const ListViewItemCardSubject({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CubitSubject, CubitSubjectStatus>(
      builder: (context, state) {
        if (state is SuccessStatee) {
          return Expanded(
              child: ListView.builder(
            itemCount: CubitSubject.subjectsCount.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: CardSubjects(isdownlod: true,
                  onPressed: () async {
                    List courses = CubitSubject.subjectsCount[index].courses;
                    final arabicFont = pw.Font.ttf(
                      await rootBundle.load('assets/fonts/Amiri-Bold.ttf'),
                    );
                    final pdf = pw.Document();
                    pdf.addPage(
                      pw.Page(
                        build: (pw.Context context) {
                          int questionCounter = 0;
                          return pw.Column(
                            crossAxisAlignment: pw.CrossAxisAlignment.start,
                            children: [
                              pw.Text(
                                'اسم الدورة : ${CubitSubject.subjectsCount[index].nameSubject}',
                                style: pw.TextStyle(
                                  fontSize: 24,
                                  fontWeight: pw.FontWeight.bold,
                                  font: arabicFont,
                                ),
                                textDirection: pw.TextDirection.rtl,
                                textAlign: pw.TextAlign.right,
                              ),
                              pw.SizedBox(height: 20),
                              ...courses.map((courseItem) {
                                questionCounter++;
                                return pw.Column(
                                  crossAxisAlignment:
                                      pw.CrossAxisAlignment.start,
                                  children: [
                                    pw.Text(
                                      '$questionCounter ${courseItem['question']}', // افترض أن courseItem يحتوي على حقل 'name'
                                      style: pw.TextStyle(
                                        fontSize: 18,
                                        font: arabicFont,
                                      ),
                                      textDirection: pw.TextDirection.rtl,
                                      textAlign: pw.TextAlign.right,
                                    ),
                                    pw.Text(
                                      'الاجابات:\n ${courseItem['answers']}', // افترض أن courseItem يحتوي على حقل 'description'
                                      style: pw.TextStyle(
                                        fontSize: 16,
                                        font: arabicFont,
                                      ),
                                      textDirection: pw.TextDirection.rtl,
                                      textAlign: pw.TextAlign.right,
                                    ),
                                    pw.SizedBox(height: 10),
                                  ],
                                );
                              }),
                            ],
                          );
                        },
                      ),
                    );
                    final outputDir = await getApplicationDocumentsDirectory();
                    final filePath = '${outputDir.path}/courses_details.pdf';
                    final file = File(filePath);
                    await file.writeAsBytes(await pdf.save());
                    print('File saved to $filePath');
                  },
                  courseDate: CubitSubject.subjectsCount[index].coursesDate,
                  seasonSubject:
                      CubitSubject.subjectsCount[index].seasonSubject,
                  subject: CubitSubject.subjectsCount[index].nameSubject,
                  classTeacher: CubitSubject.subjectsCount[index].classSabject,
                  onTap: () {
                    Navigator.pushNamed(context, ReadingGeneratedQuestions.id,
                        arguments: [
                          CubitSubject.subjectsCount[index].nameSubject,
                          CubitSubject.subjectsCount[index].classSabject,
                          CubitSubject.subjectsCount[index].coursesDate,
                          CubitSubject.subjectsCount[index].seasonSubject,
                          CubitSubject.subjectsCount[index].generateTime
                        ]);
                  },
                ),
              );
            },
          ));
        } else {
          return const Text(
            'لا يوجد اسئلة',
            style: FontStyleApp.orangeBold20,
          );
        }
      },
    );
  }
}