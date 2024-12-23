import 'package:flutter/material.dart';
import 'package:userqueize/Mobile/views/create_subject_questions_view.dart';
import 'package:userqueize/Mobile/widgets/add_teacher_view/drop_down_check_subject.dart';
import 'package:userqueize/Mobile/widgets/log_in_view/custom_button.dart';
import 'package:userqueize/Mobile/widgets/question_generate_view/container_file_upload.dart';
import 'package:userqueize/Mobile/widgets/question_generate_view/counter_column.dart';
import 'package:userqueize/Mobile/widgets/question_generate_view/switch_true_false.dart';
import 'package:userqueize/utils/custom_app_bar.dart';
import 'package:userqueize/utils/font_style.dart';

class QuestionGenerateView extends StatelessWidget {
  const QuestionGenerateView({super.key});
  static String id = 'QuestionGenerateView';
  @override
  Widget build(BuildContext context) {
    const List<String> years = ['2020', '2021', '2022', '2023', '2024'];

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
                      title: ': عدد الخيارات',
                      counterValue: 1,
                    ),
                    CounterColumn(
                      title: ': عدد الاسئلة',
                      counterValue: 5,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 17,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      Text(': أختر الدورة',
                          style: FontStyleApp.textStyleOrangeBold20),
                      SizedBox(
                        height: 15,
                      ),
                      SizedBox(
                          width: 130,
                          child: DropdownCheckSubject(items: years)),
                    ],
                  ),
                  CounterColumn(
                    title: ': عدد الاسئلة المكررة',
                    counterValue: 2,
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SwitchTrueFalse(),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.2,
                    ),
                    const Text(": هل تريد اسئلة صح أو خطأ",
                        style: FontStyleApp.textStyleOrangeBold20),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.07,
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
