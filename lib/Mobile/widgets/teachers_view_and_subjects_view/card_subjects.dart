import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:userqueize/Mobile/widgets/teachers_view_and_subjects_view/row_home_view.dart';
import 'package:userqueize/cubits/cubitSubject/cubit_subject.dart';
import 'package:userqueize/cubits/cubitTeacher/cubit_teacher.dart';
import 'package:userqueize/utils/constants.dart';
import 'package:pdf/widgets.dart' as pw;

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

  @override
  Widget build(BuildContext context) {
    List subjectInfo = ModalRoute.of(context)!.settings.arguments as List;
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
                    color: kOrange,
                    iconSize: 30,
                    onPressed: () {
                      generatePdfFile(subjectInfo);
                    }, // استدعاء الدالة هنا
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
