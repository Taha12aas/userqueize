import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:userqueize/Mobile/widgets/add_teacher_view/custom_button.dart';
import 'package:userqueize/Mobile/widgets/add_teacher_view/drop_down_check_subject.dart';
import 'package:userqueize/Mobile/widgets/question_generate_view/container_file_upload.dart';
import 'package:userqueize/utils/constants.dart';
import 'package:userqueize/utils/font_style.dart';
import 'package:userqueize/utils/responsive_text.dart';
import 'package:userqueize/utils/show_snack_bar.dart';

class ContainerCourserUpload extends StatefulWidget {
  const ContainerCourserUpload({
    super.key,
  });

  @override
  State<ContainerCourserUpload> createState() => _ContainerCourserUploadState();
}

class _ContainerCourserUploadState extends State<ContainerCourserUpload> {
  DateTime? _selectedDate;

  File? file;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: kBackGround,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Padding(
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
                          _showDatePicker(context);
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
                            items: ['اول', 'ثاني'],
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

  void _showDatePicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            "اختر سنة",
            textAlign: TextAlign.center,
          ),
          content: SizedBox(
            width: 300,
            height: 300,
            child: YearPicker(
              selectedDate: _selectedDate ?? DateTime.now(),
              onChanged: (value) {
                setState(() {
                  _selectedDate = value;
                });
                Navigator.pop(context);
              },
              firstDate: DateTime(2000),
              lastDate: DateTime.now(),
            ),
          ),
        );
      },
    );
  }
}
