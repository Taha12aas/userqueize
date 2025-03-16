import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:userqueize/Mobile/views/create_subject_questions_view.dart';
import 'package:userqueize/Mobile/widgets/log_in_view/custom_button.dart';
import 'package:userqueize/Mobile/widgets/question_generate_view/check_box.dart';
import 'package:userqueize/Mobile/widgets/question_generate_view/container_file_upload.dart';
import 'package:userqueize/Mobile/widgets/question_generate_view/questions_descreption.dart';
import 'package:userqueize/Mobile/widgets/question_generate_view/questions_level.dart';
import 'package:userqueize/Mobile/widgets/question_generate_view/repeat_coursers.dart';
import 'package:userqueize/Service/generator_service.dart';
import 'package:userqueize/cubits/cubitPreLoadedCourse/cubit_pre_loaded_course.dart';
import 'package:userqueize/utils/constants.dart';
import 'package:userqueize/utils/custom_animated_loader.dart';
import 'package:userqueize/utils/custom_app_bar.dart';
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
  List<dynamic> questions = [];
  bool isSelected = false;
  bool isSelected2 = false;
  ValueNotifier<int> qustionsCount = ValueNotifier(5);
  ValueNotifier<int> answersCount = ValueNotifier(2);
  ValueNotifier<int> trueOrFalseCount = ValueNotifier(0);
  ValueNotifier<int> frequentlyQuestionsCount = ValueNotifier(0);
  ValueNotifier<int> easy = ValueNotifier(0);
  ValueNotifier<int> normal = ValueNotifier(0);
  ValueNotifier<int> hard = ValueNotifier(0);
  List<ValueNotifier<int>> values = [];

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    List subjectName = ModalRoute.of(context)!.settings.arguments as List;
    return Scaffold(
      appBar: customAppBar('انشاء اسئلة', context),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
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
                              showSnackBar(
                                  // ignore: use_build_context_synchronously
                                  context,
                                  'الرجاء اختيار ملف',
                                  Icons.error),
                            );
                          }
                        },
                      ),
                      const SizedBox(height: 25),
                      QuestionsDescreption(
                          trueOrFalseCount: trueOrFalseCount,
                          answersCount: answersCount,
                          qustionsCount: qustionsCount),
                      const SizedBox(height: 17),
                      FittedBox(
                        child: CheckBox(
                          onChanged: (p0) {
                            if (p0 == true) {
                              isSelected = true;

                              setState(() {});
                            } else {
                              isSelected = false;
                              setState(() {});
                            }
                          },
                          isSelected: isSelected,
                          title: 'التكرار من دورة سابقة',
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      isSelected
                          ? SizedBox(
                              height: width * 0.25,
                              width: double.infinity,
                              child: ListView.builder(
                                reverse: true,
                                itemCount: CubitPreLoadedCourse.courses.length,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {

                                  values.add(ValueNotifier(0));
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: FittedBox(
                                      child: RepeatCoursers(
                                        title: CubitPreLoadedCourse
                                            .courses[index].courseHistory,
                                        frequentlyQuestionsCount: values[index],
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                          : const SizedBox(),
                      const SizedBox(height: 17),
                      FittedBox(
                        child: CheckBox(
                          onChanged: (p0) {
                            if (p0 == true) {
                              isSelected2 = true;
                              setState(() {});
                            } else {
                              isSelected2 = false;
                              setState(() {});
                            }
                          },
                          isSelected: isSelected2,
                          title: 'مستوى الاسئلة',
                        ),
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      isSelected2
                          ? QuestionsLevel(
                              hard: hard, normal: normal, easy: easy)
                          : const SizedBox(),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          CustomButtonIcon(
            onPressed: () async {
              if (file != null) {
                
                setState(() => isLoading = true);

                for (var i = 0; i < CubitPreLoadedCourse.courses.length; i++) {
                  qustionsCount.value -= values[i].value;
                  for (var j = 0; j < values[i].value; j++) {
                    questions.add(CubitPreLoadedCourse.courses[i].courses[j]);
                  }
                }

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
                log("/////////////////////////////////////");
                log(questions.toString());
                questions.addAll(jsonDecode(responseMessage));
                // ignore: use_build_context_synchronously
                Navigator.pushNamedAndRemoveUntil(
                    context, CreateSubjectQuestionsView.id, (route) => false,
                    arguments: [questions, subjectName]);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  showSnackBar(context, 'يرجى اختيار ملف', Icons.error),
                );
              }
            },
            label: 'انشاء اسئلة',
            iconData: Icons.generating_tokens_outlined,
          ),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}
