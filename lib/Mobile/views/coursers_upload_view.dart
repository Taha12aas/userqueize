import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:userqueize/Mobile/widgets/add_teacher_view/custom_button.dart';
import 'package:userqueize/Mobile/widgets/add_teacher_view/drop_down_check_subject.dart';
import 'package:userqueize/Mobile/widgets/question_generate_view/container_file_upload.dart';
import 'package:userqueize/utils/constants.dart';
import 'package:userqueize/utils/custom_app_bar.dart';
import 'package:userqueize/utils/font_style.dart';
import 'package:userqueize/utils/responsive_text.dart';
import 'package:userqueize/utils/show_snack_bar.dart';

class CoursersUploadView extends StatefulWidget {
  const CoursersUploadView({super.key});
  static String id = 'CoursersUploadView';

  @override
  State<CoursersUploadView> createState() => _CoursersUploadViewState();
}

class _CoursersUploadViewState extends State<CoursersUploadView> {
  DateTime? _selectedDate;
  File? file;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('رفع الدورات', context),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            ContainerFileUpload(
              onTap: () async {
                FilePickerResult? result = await FilePicker.platform.pickFiles(
                  allowMultiple: false,
                  type: FileType.custom,
                  allowedExtensions: ['pdf'],
                );
                if (result != null) {
                  setState(() {
                    file = File(result.files.single.path!);
                  });
                } else {
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(
                    // ignore: use_build_context_synchronously
                    showSnackBar(
                        // ignore: use_build_context_synchronously
                        context,
                        'الرجاء اختيار ملف',
                        Icons.error),
                  );
                }
              },
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(
                        _selectedDate == null
                            ? 'الدورة'
                            : '${_selectedDate!.year}',
                        style: FontStyleApp.boldOrange23.copyWith(
                          fontSize: getResponsiveText(context, 18),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      IconButton(
                        iconSize: 40,
                        color: kOrange,
                        onPressed: () {
                          // _showDatePicker(context);
                        },
                        icon: const Icon(Icons.date_range),
                      ),
                      const SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      children: [
                        Text(
                          'الفصل',
                          style: FontStyleApp.orangeBold20.copyWith(
                              fontSize: getResponsiveText(context, 18)),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const SizedBox(
                          height: 100,
                          width: 100,
                          child: DropdownCheckSubject(
                            items: [
                              'taha',
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const Spacer(),
            CustomButton(
              title: 'حفظ',
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
