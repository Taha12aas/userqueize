import 'package:flutter/material.dart';
import 'package:userqueize/Mobile/views/create_subject_questions_view.dart';
import 'package:userqueize/Mobile/widgets/add_teacher_view/drop_down_check_subject.dart';
import 'package:userqueize/Mobile/widgets/log_in_view/custom_button.dart';
import 'package:userqueize/Mobile/widgets/question_generate_view/container_file_upload.dart';
import 'package:userqueize/Mobile/widgets/question_generate_view/counter_column.dart';
import 'package:userqueize/cubits/cubitSubject/cubit_subject.dart';
import 'package:userqueize/utils/custom_app_bar.dart';
import 'package:userqueize/utils/font_style.dart';

class QuestionGenerateView extends StatelessWidget {
  const QuestionGenerateView({super.key});
  static String id = 'QuestionGenerateView';
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              const ContainerFileUpload(),
              const SizedBox(
                height: 25,
              ),
              const Padding(
                padding: EdgeInsets.only(right: 12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CounterColumn(
                      maxValue: 4,
                      title: ': عدد الخيارات',
                      counterValue: 1,
                    ),
                    CounterColumn(
                      maxValue: 60,
                      title: ': عدد الاسئلة',
                      counterValue: 5,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 17,
              ),
              const Padding(
                padding: EdgeInsets.only(right: 22),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CounterColumn(
                        title: ': عدد اسئلة الصح والخطأ',
                        counterValue: 1,
                        maxValue: 30),
                    CounterColumn(
                      maxValue: 30,
                      title: ': عدد الاسئلة المكررة',
                      counterValue: 2,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Column(
                children: [
                  const Text(': أختر الدورة التي تريد تكرار الاسئلة منها',
                      style: FontStyleApp.orangeBold20),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                      width: 130, child: DropdownCheckSubject(items: years)),
                ],
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.05,
              ),
              CustomButton(
                onPressed: () {
                  Navigator.pushNamed(context, CreateSubjectQuestionsView.id);
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
