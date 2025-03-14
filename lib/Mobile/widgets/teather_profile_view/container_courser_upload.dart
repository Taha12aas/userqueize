import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userqueize/Mobile/widgets/add_teacher_view/custom_button.dart';
import 'package:userqueize/Mobile/widgets/add_teacher_view/drop_down_check_subject.dart';
import 'package:userqueize/Mobile/widgets/question_generate_view/container_file_upload.dart';
import 'package:userqueize/Service/generator_service.dart';
import 'package:userqueize/cubits/cubitPreLoadedCourse/cubit_pre_loaded_course.dart';
import 'package:userqueize/cubits/cubitTeacher/cubit_teacher.dart';
import 'package:userqueize/models/pre_loaded_course.dart';
import 'package:userqueize/utils/constants.dart';
import 'package:userqueize/utils/custom_animated_loader.dart';
import 'package:userqueize/utils/font_style.dart';
import 'package:userqueize/utils/responsive_text.dart';
import 'package:userqueize/utils/show_snack_bar.dart';

class ContainerCourserUpload extends StatefulWidget {
  const ContainerCourserUpload({
    super.key,
    required this.subjectName,
  });
  final String subjectName;
  @override
  State<ContainerCourserUpload> createState() => _ContainerCourserUploadState();
}

class _ContainerCourserUploadState extends State<ContainerCourserUpload> {
  DateTime? _selectedDate;
  String responseMessage = '';
  String? selectSesion;
  File? file;
  bool isLoading = false;
  ValueNotifier<bool>? valueNotifier = ValueNotifier(false);

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
                        SizedBox(
                          height: 100,
                          width: 100,
                          child: DropdownCheckSubject(
                            valueNotifier: valueNotifier!,
                            items: const ['اول', 'ثاني'],
                            onChanged: (p0) {
                              selectSesion = p0;
                            },
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
              onPressed: () async {
                if (file != null &&
                    selectSesion != null &&
                    _selectedDate != null) {
                  valueNotifier!.value = true;

                  setState(() => isLoading = true);
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (BuildContext context) {
                      return const Center(
                        child: CustomAnimatedLoader(
                          color: kOrange,
                        ),
                      );
                    },
                  );
                  responseMessage = await GeneratorService.uploadAndSendMessage(
                    file!,
                    '''قم باستخراج جميع الأسئلة بدون أي إضافات و بدون رد مع تنسيق اللغة الصحيح على شكل  [
            {
          "question": "نص السؤال هنا",
          "answers": [
              "الإجابة 1",
              "الإجابة 2",
              "...",
          ]
            }
          
            للأسئلة صح أو خطأ:  
            {
          "question": "نص السؤال هنا",
          "answers": [
              "صح",
              "خطأ"
          ]
            }
          ]
                    ''',
                  );
                  // ignore: use_build_context_synchronously
                  BlocProvider.of<CubitPreLoadedCourse>(context).uploadCourse(
                      PreLoadedCourse(
                          courses: jsonDecode(responseMessage),
                          subjectName: widget.subjectName,
                          courseHistory: _selectedDate.toString(),
                          teacherPhone: CubitTeacher.user.phone,
                          season: selectSesion!));
                  setState(() => isLoading = false);
                  log(responseMessage);

                  if (mounted) {
                    setState(() => isLoading = false);
                  }

                  // ignore: use_build_context_synchronously
                  if (Navigator.canPop(context)) {
                    // ignore: use_build_context_synchronously
                    Navigator.pop(context);
                  }

                  // ignore: use_build_context_synchronously
                  if (Navigator.canPop(context)) {
                    // ignore: use_build_context_synchronously
                    Navigator.pop(context);
                  }
                } else {
                  valueNotifier!.value = false;


                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }

                  ScaffoldMessenger.of(context).showSnackBar(
                    showSnackBar(
                        context, 'يرجى تعبئة الحقول كاملة ', Icons.error),
                  );
                }
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
