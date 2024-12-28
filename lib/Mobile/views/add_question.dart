// import 'package:flutter/material.dart';
// import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
// import 'package:userqueize/Mobile/widgets/add_teacher_view/custom_button.dart';
// import 'package:userqueize/Mobile/widgets/add_teacher_view/info_text_field.dart';
// import 'package:userqueize/utils/custom_app_bar.dart';
// import 'package:userqueize/utils/font_style.dart';

// class AddQuestion extends StatefulWidget {
//   const AddQuestion({super.key});
//   static String id = 'AddQuestion';

//   @override
//   State<AddQuestion> createState() => _AddQuestionState();
// }

// class _AddQuestionState extends State<AddQuestion> {
//   TextEditingController questionController = TextEditingController();
//   TextEditingController answerOneController = TextEditingController();
//   TextEditingController answerTowController = TextEditingController();
//   TextEditingController answerThreeController = TextEditingController();
//   TextEditingController answerFourController = TextEditingController();
//   GlobalKey<FormState> globalKey = GlobalKey();
//   @override
//   void dispose() {
//     questionController.dispose();
//     answerOneController.dispose();
//     answerTowController.dispose();
//     answerThreeController.dispose();
//     answerFourController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     List<dynamic> fullQuestion =
//         ModalRoute.of(context)!.settings.arguments as List;

//     double height = MediaQuery.of(context).size.height;
//     return Form(
//       key: globalKey,
//       child: Scaffold(
//         appBar: customAppBar('اضافة سؤال', context),
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(18),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.end,
//               children: [
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 const Text(
//                   ': السؤال',
//                   style: FontStyleApp.orangeDinNextLTArabic18,
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 InfoTextField(
//                     validator: validateToQuestion,
//                     controller: questionController,
//                     iconData: FontAwesomeIcons.circlePlus),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 const Text(
//                   ': الخيار الاول',
//                   style: FontStyleApp.orangeDinNextLTArabic18,
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 InfoTextField(
//                     validator: validateToQuestion,
//                     controller: answerOneController,
//                     iconData: FontAwesomeIcons.commentMedical),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 const Text(
//                   ': الخيار الثاني',
//                   style: FontStyleApp.orangeDinNextLTArabic18,
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 InfoTextField(
//                     validator: validateToQuestion,
//                     controller: answerTowController,
//                     iconData: FontAwesomeIcons.commentMedical),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 const Text(
//                   ': الخيار الثالث',
//                   style: FontStyleApp.orangeDinNextLTArabic18,
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 InfoTextField(
//                     controller: answerThreeController,
//                     iconData: FontAwesomeIcons.commentMedical),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 const Text(
//                   ': الخيار الرابع',
//                   style: FontStyleApp.orangeDinNextLTArabic18,
//                 ),
//                 const SizedBox(
//                   height: 10,
//                 ),
//                 InfoTextField(
//                     controller: answerFourController,
//                     iconData: FontAwesomeIcons.commentMedical),
//                 SizedBox(
//                   height: height * 0.04,
//                 ),
//                 CustomButton(
//                   title: 'اضافة سؤال',
//                   onPressed: () {
                    // if (globalKey.currentState!.validate()) {
                    //   fullQuestion.add({
                    //     'question': questionController.text,
                    //     'answers': [
                    //       answerOneController.text,
                    //       answerTowController.text,
                    //       answerThreeController.text,
                    //       answerFourController.text
                    //     ]
                    //   });
//                     //   Navigator.pop(context, fullQuestion);
//                     // }
//                   },
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
