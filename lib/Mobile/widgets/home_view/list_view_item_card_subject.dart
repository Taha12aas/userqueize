import 'dart:convert';
import 'dart:io';
import 'package:archive/archive.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:userqueize/Mobile/views/reading_generated_questions.dart';
import 'package:userqueize/Mobile/widgets/teachers_view_and_subjects_view/card_subjects.dart';
import 'package:userqueize/cubits/cubitSubject/cubit_subject.dart';
import 'package:userqueize/cubits/cubitSubject/cubit_subject_status.dart';
import 'package:userqueize/utils/font_style.dart';

class ListViewItemCardSubject extends StatelessWidget {
  const ListViewItemCardSubject({super.key});

  Future<bool> _requestStoragePermission(BuildContext context) async {
    if (Platform.isAndroid) {
      final status = await Permission.manageExternalStorage.request();
      if (!status.isGranted) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text("يجب منح صلاحية التخزين أولاً"),
            action: SnackBarAction(
              label: 'فتح الإعدادات',
              onPressed: () => openAppSettings(),
            ),
          ),
        );
        return false;
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CubitSubject, CubitSubjectStatus>(
      builder: (context, state) {
        if (state is SuccessStatee) {
          return Expanded(
            child: ListView.builder(
              itemCount: CubitSubject.subjectsCount.length,
              itemBuilder: (context, index) {
                final subject = CubitSubject.subjectsCount[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: CardSubjects(
                    isdownlod: true,
                    onPressed: () async {
                      if (subject.courses.isEmpty) return;

                      // طلب صلاحية التخزين
                      bool granted = await _requestStoragePermission(context);
                      if (!granted) return;

                      final buffer = StringBuffer();
                      buffer.writeln(
                          r'''<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<w:document xmlns:w="http://schemas.openxmlformats.org/wordprocessingml/2006/main">
  <w:body>''');

                      String createRightAlignedParagraph(String text,
                          {bool bold = false, int fontSize = 28}) {
                        return '''
<w:p>
  <w:pPr>
    <w:jc w:val="right"/>
    <w:bidi/>
  </w:pPr>
  <w:r>
    <w:rPr>
      ${bold ? "<w:b/>" : ""}
      <w:sz w:val="$fontSize"/>
      <w:bidi/>
    </w:rPr>
    <w:t xml:lang="ar-SA" xml:space="preserve">$text</w:t>
  </w:r>
</w:p>''';
                      }

                      buffer.writeln(createRightAlignedParagraph(
                          'اسم الدورة: ${subject.nameSubject}',
                          bold: true));
                      buffer.writeln(createRightAlignedParagraph(
                          'الصف: ${subject.classSabject}    الفصل: ${subject.seasonSubject}'));
                      buffer.writeln('<w:p><w:r><w:t></w:t></w:r></w:p>');

                      int counter = 1;
                      for (var course in subject.courses) {
                        final question = course['question'];
                        final answers = course['answers'];
                        if (question == null || answers == null) continue;

                        buffer.writeln(createRightAlignedParagraph(
                            'سؤال $counter: $question',
                            bold: true,
                            fontSize: 28));

                        for (final answer in answers) {
                          buffer.writeln(
                              createRightAlignedParagraph('• $answer'));
                        }

                        buffer.writeln('<w:p><w:r><w:t></w:t></w:r></w:p>');
                        counter++;
                      }

                      buffer.writeln('</w:body></w:document>');

                      const contentTypesXml =
                          '''<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Types xmlns="http://schemas.openxmlformats.org/package/2006/content-types">
  <Default Extension="rels" ContentType="application/vnd.openxmlformats-package.relationships+xml"/>
  <Default Extension="xml" ContentType="application/xml"/>
  <Override PartName="/word/document.xml" ContentType="application/vnd.openxmlformats-officedocument.wordprocessingml.document.main+xml"/>
</Types>''';

                      const relsXml =
                          '''<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships">
  <Relationship Id="rId1" Type="http://schemas.openxmlformats.org/officeDocument/2006/relationships/officeDocument" Target="word/document.xml"/>
</Relationships>''';

                      final archive = Archive();
                      archive.addFile(ArchiveFile(
                          '[Content_Types].xml',
                          contentTypesXml.length,
                          utf8.encode(contentTypesXml)));
                      archive.addFile(ArchiveFile(
                          '_rels/.rels', relsXml.length, utf8.encode(relsXml)));
                      archive.addFile(ArchiveFile('word/document.xml',
                          buffer.length, utf8.encode(buffer.toString())));

                      final zipData = ZipEncoder().encode(archive);

                      // حفظ الملف في مجلد التنزيلات (Downloads)
                      final dirs = await getExternalStorageDirectories(
                          type: StorageDirectory.downloads);
                      final dir = dirs?.first;
                      if (dir == null) {
                        // ignore: use_build_context_synchronously
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content:
                                  Text('❌ تعذر الوصول إلى مجلد التنزيلات')),
                        );
                        return;
                      }

                      final filePath =
                          '${dir.path}/${subject.nameSubject}_questions.docx';
                      final file = File(filePath);
                      await file.writeAsBytes(zipData);

                      // ignore: use_build_context_synchronously
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                            content: Text(
                                '✅ تم حفظ ملف Word في مجلد التنزيلات:\n$filePath')),
                      );
                      debugPrint('File saved at: $filePath');
                    },
                    courseDate: subject.coursesDate,
                    seasonSubject: subject.seasonSubject,
                    subject: subject.nameSubject,
                    classTeacher: subject.classSabject,
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        ReadingGeneratedQuestions.id,
                        arguments: [
                          subject.nameSubject,
                          subject.classSabject,
                          subject.coursesDate,
                          subject.seasonSubject,
                          subject.generateTime,
                        ],
                      );
                    },
                  ),
                );
              },
            ),
          );
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
