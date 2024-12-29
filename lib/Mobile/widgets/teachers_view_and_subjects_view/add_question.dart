import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:userqueize/Mobile/widgets/add_teacher_view/custom_button.dart';
import 'package:userqueize/Mobile/widgets/add_teacher_view/info_text_field.dart';
import 'package:userqueize/utils/constants.dart';
import 'package:userqueize/utils/font_style.dart';

Future<dynamic> showModealBottomSheetAddQuestion(
    BuildContext context, double height,List<dynamic> fullQuestionText) {
  TextEditingController questionController = TextEditingController();
  TextEditingController answerOneController = TextEditingController();
  TextEditingController answerTowController = TextEditingController();
  TextEditingController answerThreeController = TextEditingController();
  TextEditingController answerFourController = TextEditingController();
  

  String? validateToQuestion(String? question) {
    if (question!.isEmpty) {
      return 'الحقل مطلوب';
    }
    return null;
  }

  return showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (context) {
      return Container(
        color: kBackGround,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  ': السؤال',
                  style: FontStyleApp.orangeDinNextLTArabic18,
                ),
                const SizedBox(
                  height: 10,
                ),
                InfoTextField(
                    validator: validateToQuestion,
                    controller: questionController,
                    iconData: FontAwesomeIcons.circlePlus),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  ': الخيار الاول',
                  style: FontStyleApp.orangeDinNextLTArabic18,
                ),
                const SizedBox(
                  height: 10,
                ),
                InfoTextField(
                    validator: validateToQuestion,
                    controller: answerOneController,
                    iconData: FontAwesomeIcons.commentMedical),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  ': الخيار الثاني',
                  style: FontStyleApp.orangeDinNextLTArabic18,
                ),
                const SizedBox(
                  height: 10,
                ),
                InfoTextField(
                    validator: validateToQuestion,
                    controller: answerTowController,
                    iconData: FontAwesomeIcons.commentMedical),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  ': الخيار الثالث',
                  style: FontStyleApp.orangeDinNextLTArabic18,
                ),
                const SizedBox(
                  height: 10,
                ),
                InfoTextField(
                    controller: answerThreeController,
                    iconData: FontAwesomeIcons.commentMedical),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  ': الخيار الرابع',
                  style: FontStyleApp.orangeDinNextLTArabic18,
                ),
                const SizedBox(
                  height: 10,
                ),
                InfoTextField(
                    controller: answerFourController,
                    iconData: FontAwesomeIcons.commentMedical),
                SizedBox(
                  height: height * 0.04,
                ),
                CustomButton(
                    title: 'اضافة سؤال',
                    onPressed: () {
                      fullQuestionText.add({
                        'question': questionController.text,
                        'answers': [
                          answerOneController.text,
                          answerTowController.text,
                          answerThreeController.text,
                          answerFourController.text
                        ]
                      });
                      questionController.clear();
                      answerOneController.clear();
                      answerTowController.clear();
                      answerThreeController.clear();
                      answerFourController.clear();
                      Navigator.pop(
                        context,
                      );
                    })
              ],
            ),
          ),
        ),
      );
    },
  );
}
