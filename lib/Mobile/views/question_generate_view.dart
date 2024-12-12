import 'package:flutter/material.dart';
import 'package:userqueize/Mobile/views/create_subject_questions_view.dart';
import 'package:userqueize/Mobile/widgets/add_teacher_view/drop_down_check_subject.dart';
import 'package:userqueize/Mobile/widgets/log_in_view/custom_button.dart';
import 'package:userqueize/Mobile/widgets/question_generate_view/container_file_upload.dart';
import 'package:userqueize/Mobile/widgets/question_generate_view/counter_column.dart';
import 'package:userqueize/utils/custom_app_bar.dart';

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
               FittedBox(
                child: Row(
                  children: [
                    const CounterColumn(
                      title: ': عدد الخيارات',
                    ),SizedBox(width: MediaQuery.sizeOf(context).width*0.15,),
                    const CounterColumn(
                      title: ': عدد الاسئلة',
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 17,
              ),
               FittedBox(
                child: Row(
                  children: [
                    const Column(crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          ': أختر الدورة',
                          style: TextStyle(color: Colors.orange, fontSize: 20),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                            width: 140,
                            child: DropdownCheckSubject(items: years)),
                      ],
                    ),
                    SizedBox(width: MediaQuery.sizeOf(context).width*0.15,),
                    const CounterColumn(title: ': عدد الاسئلة المكررة')
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.15,
              ),
              CustomButton(
                  onPressed: () {
                    Navigator.pushNamed(context, CreateSubjectQuestionsView.id);
                  },
                  label: 'انشاء اسئلة',
                  iconData: Icons.generating_tokens_outlined)
            ],
          ),
        ),
      ),
    );
  }
}
