import 'package:flutter/material.dart';
import 'package:userqueize/Mobile/widgets/add_teacher_view/custom_button.dart';
import 'package:userqueize/Mobile/widgets/add_teacher_view/info_text_field.dart';
import 'package:userqueize/utils/custom_app_bar.dart';
import 'package:userqueize/utils/font_style.dart';

class AddQuestion extends StatelessWidget {
  const AddQuestion({super.key});
  static String id = 'AddQuestion';
  @override
  Widget build(BuildContext context) {
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
              const InfoTextField(hintText: 'سؤال', iconData: Icons.abc),
              const SizedBox(
                height: 20,
              ),
              const Text(
                ': السؤال',
                style: FontStyleApp.textStyleOrange18,
              ),
              const InfoTextField(
                  hintText: 'الخيار الاول', iconData: Icons.abc),
              const Text(
                ': السؤال',
                style: FontStyleApp.textStyleOrange18,
              ),
              const SizedBox(
                height: 20,
              ),
              const InfoTextField(
                  hintText: 'الخيار الثاني', iconData: Icons.abc),
              const Text(
                ': السؤال',
                style: FontStyleApp.textStyleOrange18,
              ),
              const InfoTextField(
                  hintText: 'الخيار الثالث', iconData: Icons.abc),
              const Text(
                ': السؤال',
                style: FontStyleApp.textStyleOrange18,
              ),
              const InfoTextField(
                  hintText: 'الخيار الرابع', iconData: Icons.abc),
              const SizedBox(
                height: 20,
              ),
              CustomButton(
                title: 'اضافة سؤال',
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
