import 'package:flutter/material.dart';
import 'package:userqueize/utils/constants.dart';
import 'package:userqueize/utils/font_style.dart';
import 'package:userqueize/utils/responsive_text.dart';

class TeacherCardDropDownSearchItem extends StatelessWidget {
  const TeacherCardDropDownSearchItem({
    super.key,
    required this.onTap,
    required this.teacherName,
    required this.teacherImge,
  });
  final void Function()? onTap;

  final String teacherName;
  final String teacherImge;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: screenHeight * 0.12,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: kAshenColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  ' اسم المادة  :  ',
                  style: FontStyleApp.textStylewite15
                      .copyWith(fontSize: getResponsiveText(context, 15)),
                ),
                Text(
                  teacherName,
                  style: FontStyleApp.textStyleOrange15
                      .copyWith(fontSize: getResponsiveText(context, 15)),
                ),
              ],
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                teacherImge,
                height: screenHeight * 0.074,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
