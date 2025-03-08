import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:userqueize/Mobile/views/create_subject_questions_view.dart';
import 'package:userqueize/Mobile/widgets/add_teacher_view/drop_down_check_subject.dart';
import 'package:userqueize/Mobile/widgets/log_in_view/custom_button.dart';
import 'package:userqueize/Mobile/widgets/question_generate_view/container_file_upload.dart';
import 'package:userqueize/Mobile/widgets/question_generate_view/counter_column.dart';
import 'package:userqueize/Service/generator_service.dart';
import 'package:userqueize/cubits/cubitSubject/cubit_subject.dart';
import 'package:userqueize/utils/constants.dart';
import 'package:userqueize/utils/custom_animated_loader.dart';
import 'package:userqueize/utils/custom_app_bar.dart';
import 'package:userqueize/utils/font_style.dart';
import 'package:userqueize/utils/responsive_text.dart';
import 'package:userqueize/utils/show_snack_bar.dart';

class QuestionGenerateView extends StatefulWidget {
  const QuestionGenerateView({super.key});
  static String id = 'QuestionGenerateView';

  @override
  State<QuestionGenerateView> createState() => _QuestionGenerateViewState();
}

class _QuestionGenerateViewState extends State<QuestionGenerateView> {
  File? file;
  String responseMessage = '';
  bool isLoading = false;
  ValueNotifier<int> qustionsCount = ValueNotifier(5);
  ValueNotifier<int> answersCount = ValueNotifier(2);
  ValueNotifier<int> trueOrFalseCount = ValueNotifier(0);
  ValueNotifier<int> frequentlyQuestionsCount = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    List subjectName = ModalRoute.of(context)!.settings.arguments as List;
    List<String> years = [];
    for (var i = 0; i < CubitSubject.subjectsCount.length; i++) {
      if (subjectName[1] == CubitSubject.subjectsCount[i].nameSubject &&
          subjectName[0] == CubitSubject.subjectsCount[i].classSabject) {
        years.add(CubitSubject.subjectsCount[i].coursesDate);
      }
    }

    return Scaffold(
      appBar: customAppBar('انشاء اسئلة', context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              ContainerFileUpload(
                onTap: () async {
                  FilePickerResult? result =
                      await FilePicker.platform.pickFiles(
                    allowMultiple: false,
                    type: FileType.custom,
                    allowedExtensions: ['pdf', 'docx'],
                  );
                  if (result != null) {
                    setState(() {
                      file = File(result.files.single.path!);
                    });
                  } else {
                    // ignore: use_build_context_synchronously
                    ScaffoldMessenger.of(context).showSnackBar(
                      // ignore: use_build_context_synchronously
                      showSnackBar(context, 'الرجاء اختيار ملف', Icons.error),
                    );
                  }
                },
              ),
              const SizedBox(height: 25),
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: CounterColumn(
                        minValue: 0,
                        valueNotifier: trueOrFalseCount,
                        title: ': الصح والخطأ',
                        counterValue: 1,
                        maxValue: 29,
                      ),
                    ),
                    Expanded(
                      child: CounterColumn(
                        minValue: 2,
                        valueNotifier: answersCount,
                        maxValue: 3,
                        title: ': الخيارات',
                        counterValue: 1,
                      ),
                    ),
                    Expanded(
                      child: CounterColumn(
                        minValue: 5,
                        valueNotifier: qustionsCount,
                        maxValue: 55,
                        title: ': الاسئلة',
                        counterValue: 5,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 17),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'التكرار من دورة سابقة',
                    style: FontStyleApp.orangeBold20.copyWith(
                      fontSize: getResponsiveText(context, 18),
                    ),
                  ),
                  Checkbox(
                    activeColor: kOrange,
                    value: true,
                    onChanged: (value) {
                      value = false;
                    },
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 22),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: CounterColumn(
                        minValue: 0,
                        valueNotifier: frequentlyQuestionsCount,
                        maxValue: 28,
                        title: ': الاسئلة المكررة',
                        counterValue: 2,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    ': أختر الدورة التي تريد تكرار الاسئلة منها',
                    style: FontStyleApp.orangeBold20.copyWith(
                      fontSize: getResponsiveText(context, 20),
                    ),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: 130,
                    child: DropdownCheckSubject(items: years),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              CustomButtonIcon(
                onPressed: () async {
                  if (file != null) {
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
                    responseMessage =
                        await GeneratorService.uploadAndSendMessage(
                      file!,
                      '''قم بتوليد ${qustionsCount.value} أسئلة متعددة الخيارات (كل سؤال يحتوي على ${answersCount.value} خيارات) ومن ضمنها (${trueOrFalseCount.value}) أسئلة صح أو خطأ من الملف التالي بصيغة التالية فقط وبدون أي إضافات وبدون ذكر اسئلة تخص الصفحات:  

للأسئلة متعددة الخيارات:  
[
  {
      "question": "نص السؤال هنا",
      "answers": [
          "الإجابة 1",
          "الإجابة 2",
          "...",
          "الإجابة ${answersCount.value}"
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
                    setState(() => isLoading = false);
                    log(responseMessage);
                    // ignore: use_build_context_synchronously
                    Navigator.pushNamed(context, CreateSubjectQuestionsView.id,
                        arguments: [jsonDecode(responseMessage), subjectName]);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      showSnackBar(
                          context, 'يرجى اختيار ملف وإدخال رسالة', Icons.error),
                    );
                  }
                },
                label: 'انشاء اسئلة',
                iconData: Icons.generating_tokens_outlined,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
