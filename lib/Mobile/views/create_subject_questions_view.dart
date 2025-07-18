import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:userqueize/Mobile/views/home_view.dart';
import 'package:userqueize/Mobile/widgets/CreateSubjectQuestionsView/question_and_answer.dart';
import 'package:userqueize/Mobile/widgets/add_teacher_view/info_text_field.dart';
import 'package:userqueize/Mobile/widgets/log_in_view/custom_button.dart';
import 'package:userqueize/cubits/cubitSubject/cubit_subject.dart';
import 'package:userqueize/cubits/cubitTeacher/cubit_teacher.dart';
import 'package:userqueize/models/subject.dart';
import 'package:userqueize/utils/constants.dart';
import 'package:userqueize/utils/custom_animated_loader.dart';
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

  List fullQuestionTex = [];

  @override
  void dispose() {
    questionController.dispose();
    answerOneController.dispose();
    answerTowController.dispose();
    answerThreeController.dispose();
    answerFourController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (fullQuestionTex.isEmpty) {
      final args =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      fullQuestionTex = List.from(args['questions'] ?? []);
    }
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final List subjectInfo = args['subject'] ?? [];
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: kOrangeBlackColor,
        child: const Icon(
          Icons.add,
          color: kOrange,
        ),
        onPressed: () {
          showModalBottomSheetAddQuestion(context, height);
        },
      ),
      appBar: customAppBar('الأسئلة المولدة', context),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
              QuestionAndAnswer(
                data: fullQuestionTex,
                isIcon: true,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: CustomButtonIcon(
                  iconData: Icons.save_alt,
                  label: 'حفظ',
                  onPressed: () async {
                    BlocProvider.of<CubitSubject>(context).addCourse(
                      SubjectsGenerated(
                        nameSubject: subjectInfo[1],
                        classSabject: subjectInfo[0],
                        coursesDate: DateTime.now().year.toString(),
                        courses: fullQuestionTex,
                        nameTeacher: CubitTeacher.user.name,
                        seasonSubject: DateTime.now().month < DateTime.march
                            ? 'اول'
                            : 'ثاني',
                        generateTime: DateTime.now().toString(),
                      ),
                    );
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (BuildContext context) {
                        return const Center(
                          child: CustomAnimatedLoader(
                            color: kWhite,
                          ),
                        );
                      },
                    );
                    await Future.delayed(const Duration(seconds: 4));
                    CubitSubject.subjectsCount.clear();
                    Navigator.pushNamedAndRemoveUntil(
                        context, HomeView.id, (route) => false,
                        arguments: false);
                  },
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
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
      backgroundColor: Colors.transparent,
      builder: (context) {
        return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.85,
          maxChildSize: 0.95,
          minChildSize: 0.4,
          builder: (context, scrollController) {
            return Container(
              decoration: const BoxDecoration(
                color: kBackGround,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(26),
                  topRight: Radius.circular(26),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  left: 15,
                  right: 15,
                  bottom: MediaQuery.of(context).viewInsets.bottom + 15,
                  top: 20,
                ),
                child: Form(
                  key: globalKey,
                  child: SingleChildScrollView(
                    controller: scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text(
                          ': السؤال',
                          style: FontStyleApp.orangeDinNextLTArabic18,
                        ),
                        const SizedBox(height: 10),
                        InfoTextField(
                          validator: validateToQuestion,
                          controller: questionController,
                          iconData: FontAwesomeIcons.circlePlus,
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          ': الخيار الأول',
                          style: FontStyleApp.orangeDinNextLTArabic18,
                        ),
                        const SizedBox(height: 10),
                        InfoTextField(
                          validator: validateToQuestion,
                          controller: answerOneController,
                          iconData: FontAwesomeIcons.commentMedical,
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          ': الخيار الثاني',
                          style: FontStyleApp.orangeDinNextLTArabic18,
                        ),
                        const SizedBox(height: 10),
                        InfoTextField(
                          validator: validateToQuestion,
                          controller: answerTowController,
                          iconData: FontAwesomeIcons.commentMedical,
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          ': الخيار الثالث',
                          style: FontStyleApp.orangeDinNextLTArabic18,
                        ),
                        const SizedBox(height: 10),
                        InfoTextField(
                          controller: answerThreeController,
                          iconData: FontAwesomeIcons.commentMedical,
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          ': الخيار الرابع',
                          style: FontStyleApp.orangeDinNextLTArabic18,
                        ),
                        const SizedBox(height: 10),
                        InfoTextField(
                          controller: answerFourController,
                          iconData: FontAwesomeIcons.commentMedical,
                        ),
                        const SizedBox(height: 30),
                        CustomButtonIcon(
                          iconData: Icons.add_box_outlined,
                          label: 'اضافة سؤال',
                          onPressed: () {
                            if (globalKey.currentState!.validate()) {
                              setState(() {
                                fullQuestionTex.add({
                                  'question': questionController.text,
                                  'answers': [
                                    answerOneController.text,
                                    answerTowController.text,
                                    answerThreeController.text,
                                    answerFourController.text,
                                  ],
                                });
                                questionController.clear();
                                answerOneController.clear();
                                answerTowController.clear();
                                answerThreeController.clear();
                                answerFourController.clear();
                              });
                              Navigator.pop(context);
                            }
                          },
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
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
