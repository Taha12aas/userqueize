import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:userqueize/Mobile/widgets/add_teacher_view/custom_button.dart';
import 'package:userqueize/Mobile/widgets/add_teacher_view/info_text_field.dart';
import 'package:userqueize/utils/custom_app_bar.dart';
import 'package:userqueize/utils/font_style.dart';

class AddQuestion extends StatelessWidget {
  const AddQuestion({super.key});
  static String id = 'AddQuestion';
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: customAppBar('اضافة سؤال', context),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                ': السؤال',
                style: FontStyleApp.textStyleOrange18,
              ),
              const SizedBox(
                height: 10,
              ),
              const InfoTextField(
                  // controller: , : 'سؤال',
                  iconData: FontAwesomeIcons.circlePlus),
              const SizedBox(
                height: 10,
              ),
              const Text(
                ': الخيار الاول',
                style: FontStyleApp.textStyleOrange18,
              ),
              const SizedBox(
                height: 10,
              ),
              const InfoTextField(
                  // initialValue: 'الخيار الاول',
                  iconData: FontAwesomeIcons.commentMedical),
              const SizedBox(
                height: 10,
              ),
              const Text(
                ': الخيار الثاني',
                style: FontStyleApp.textStyleOrange18,
              ),
              const SizedBox(
                height: 10,
              ),
              const InfoTextField(
                  //  initialValue: 'الخيار الثاني',
                  iconData: FontAwesomeIcons.commentMedical),
              const SizedBox(
                height: 10,
              ),
              const Text(
                ': الخيار الثالث',
                style: FontStyleApp.textStyleOrange18,
              ),
              const SizedBox(
                height: 10,
              ),
              const InfoTextField(
                  //   initialValue: 'الخيار الثالث',
                  iconData: FontAwesomeIcons.commentMedical),
              const SizedBox(
                height: 10,
              ),
              const Text(
                ': الخيار الرابع',
                style: FontStyleApp.textStyleOrange18,
              ),
              const SizedBox(
                height: 10,
              ),
              const InfoTextField(
                  // controller: 'الخيار الرابع',
                  iconData: FontAwesomeIcons.commentMedical),
              SizedBox(
                height: height * 0.04,
              ),
              CustomButton(
                title: 'اضافة سؤال',
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
