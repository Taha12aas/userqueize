import 'package:flutter/material.dart';
import 'package:userqueize/Mobile/views/create_subject_questions_view.dart';
import 'package:userqueize/Mobile/widgets/log_in_view/custom_button.dart';
import 'package:userqueize/Mobile/widgets/question_generate_view/container_file_upload.dart';
import 'package:userqueize/utils/custom_app_bar.dart';

class QuestionGenerateView extends StatelessWidget {
  const QuestionGenerateView({super.key});
  static String id = 'QuestionGenerateView';

  @override
  Widget build(BuildContext context) {
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
              SizedBox(height: MediaQuery.sizeOf(context).height*0.15,),
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
