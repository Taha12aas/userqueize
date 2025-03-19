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
                child: CardSubjects(

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
  
  Future<void> generatePdfFile(List subjectInfo) async {
    // تحميل الخط العربي
    
    final arabicFont = pw.Font.ttf(
      await rootBundle.load('assets/fonts/Amiri-Bold.ttf'),
    );

    // إنشاء مستند PDF
    final pdf = pw.Document();

    // البحث عن الدورات المطابقة
    List<dynamic> course = [];
    for (var i = 0; i < CubitSubject.subjectsCount.length; i++) {
      if (subjectInfo[0] == CubitSubject.subjectsCount[i].nameSubject &&
          subjectInfo[1] == CubitSubject.subjectsCount[i].classSabject &&
          subjectInfo[2] == CubitSubject.subjectsCount[i].coursesDate &&
          subjectInfo[3] == CubitSubject.subjectsCount[i].seasonSubject &&
          subjectInfo[4] == CubitSubject.subjectsCount[i].generateTime) {
        course.addAll(CubitSubject.subjectsCount[i].courses);
      }
    }

    // إضافة محتوى إلى PDF
    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              // عنوان الصفحة
              pw.Text(
                'تفاصيل الدورات',
                style: pw.TextStyle(
                  fontSize: 24,
                  fontWeight: pw.FontWeight.bold,
                  font: arabicFont,
                ),
                textDirection: pw.TextDirection.rtl,
                textAlign: pw.TextAlign.right,
              ),
              pw.SizedBox(height: 20),

              // تكرار المحتوى من الـ course
              ...course.map((courseItem) {
                return pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      'اسم الدورة: ${courseItem['name']}', // افترض أن courseItem يحتوي على حقل 'name'
                      style: pw.TextStyle(
                        fontSize: 18,
                        font: arabicFont,
                      ),
                      textDirection: pw.TextDirection.rtl,
                      textAlign: pw.TextAlign.right,
                    ),
                    pw.Text(
                      'الوصف: ${courseItem['description']}', // افترض أن courseItem يحتوي على حقل 'description'
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
              }).toList(),
            ],
          );
        },
      ),
    );

    // حفظ الملف
    final outputDir = await getApplicationDocumentsDirectory();
    final filePath = '${outputDir.path}/courses_details.pdf';
    final file = File(filePath);
    await file.writeAsBytes(await pdf.save());

    print('File saved to $filePath');
  }

}
