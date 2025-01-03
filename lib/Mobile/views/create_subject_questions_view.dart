import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:userqueize/Mobile/views/home_view.dart';
import 'package:userqueize/Mobile/widgets/CreateSubjectQuestionsView/question_and_answer.dart';
import 'package:userqueize/Mobile/widgets/add_teacher_view/custom_button.dart';
import 'package:userqueize/Mobile/widgets/add_teacher_view/info_text_field.dart';
import 'package:userqueize/utils/constants.dart';
import 'package:userqueize/utils/custom_app_bar.dart';
import 'package:userqueize/utils/font_style.dart';

class CreateSubjectQuestionsView extends StatefulWidget {
  const CreateSubjectQuestionsView({super.key});
  static String id = 'CreateSubjectQuestionsView';

  @override
  State<CreateSubjectQuestionsView> createState() =>
      _CreateSubjectQuestionsViewState();
}

class _CreateSubjectQuestionsViewState
    extends State<CreateSubjectQuestionsView> {
  TextEditingController questionController = TextEditingController();
  TextEditingController answerOneController = TextEditingController();
  TextEditingController answerTowController = TextEditingController();
  TextEditingController answerThreeController = TextEditingController();
  TextEditingController answerFourController = TextEditingController();

  @override
  void dispose() {
    questionController.dispose();
    answerOneController.dispose();
    answerTowController.dispose();
    answerThreeController.dispose();
    answerFourController.dispose();
    super.dispose();
  }

  List<dynamic> fullQuestionText = [
    {
      "question": "ما هو الذكاء الاصطناعي؟",
      "answers": [
        "القدرات الذهنية البشرية",
        "الذكاء الذي تبديه الآلات",
        "أنماط العمل الحاسوبي",
        "الآلات الذكية"
      ]
    },
    {
      "question": "من هو الباحث الذي وضع مصطلح الذكاء الاصطناعي؟",
      "answers": [
        "جون مكارثي",
        "إلنور أوستروم",
        "إدجار كود",
        "هنري فوكس تالبوت"
      ]
    },
  ];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: kOrangeBlackColor,
        child: const Icon(
          Icons.add,
          color: kOrangeColor,
        ),
        onPressed: () {
          showModalBottomSheetAddQuestion(context, height);
        },
      ),
      appBar: customAppBar('الأسئلة المولدة', context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            QuestionAndAnswer(
              data: fullQuestionText,
              isIcon: true,
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  HomeView.id,
                  (route) => false,
                );
              },
              icon: const Icon(Icons.save),
              label: const Text('حفظ'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  Future<dynamic> showModalBottomSheetAddQuestion(
      BuildContext context, double height) {
    GlobalKey<FormState> globalKey = GlobalKey();
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Form(
          key: globalKey,
          child: Container(
            decoration: const BoxDecoration(
              color: kBackGround,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(26),
                topRight: Radius.circular(26),
              ),
            ),
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
                        setState(() {
                          if (globalKey.currentState!.validate()) {
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
                          }
                        });
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  String? validateToQuestion(String? question) {
    if (question!.trim().isEmpty) {
      return 'الحقل مطلوب';
    }
    return null;
  }
}
