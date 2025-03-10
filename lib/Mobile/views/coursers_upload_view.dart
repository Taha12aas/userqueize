import 'package:flutter/material.dart';
import 'package:userqueize/Mobile/widgets/add_teacher_view/custom_button.dart';
import 'package:userqueize/Mobile/widgets/add_teacher_view/drop_down_check_subject.dart';
import 'package:userqueize/Mobile/widgets/question_generate_view/container_file_upload.dart';
import 'package:userqueize/utils/constants.dart';
import 'package:userqueize/utils/custom_app_bar.dart';
import 'package:userqueize/utils/font_style.dart';
import 'package:userqueize/utils/responsive_text.dart';

class CoursersUploadView extends StatefulWidget {
  const CoursersUploadView({super.key});
  static String id = 'CoursersUploadView';

  @override
  State<CoursersUploadView> createState() => _CoursersUploadViewState();
}

class _CoursersUploadViewState extends State<CoursersUploadView> {
  DateTime? _selectedDate;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('رفع الدورات', context),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            ContainerFileUpload(
              onTap: () {},
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text(
                      'الصف',
                      style: FontStyleApp.orangeBold20
                          .copyWith(fontSize: getResponsiveText(context, 18)),
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
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      'اسم المادة',
                      style: FontStyleApp.orangeBold20
                          .copyWith(fontSize: getResponsiveText(context, 18)),
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
                    )
                  ],
                ),
              ],
            ),
            Row(
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
                Column(
                  children: [
                    Text(
                      'الفصل',
                      style: FontStyleApp.orangeBold20
                          .copyWith(fontSize: getResponsiveText(context, 18)),
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
                )
              ],
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
          title: const Text("اختر سنة",textAlign: TextAlign.center,),
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
