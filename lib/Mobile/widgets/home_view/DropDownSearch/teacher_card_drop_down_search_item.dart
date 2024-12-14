import 'package:flutter/material.dart';
import 'package:userqueize/utils/constants.dart';
import 'package:userqueize/utils/font_style.dart';
import 'package:userqueize/utils/responsive_text.dart';

class TeacherCardDropDownSearchItem extends StatelessWidget {
  const TeacherCardDropDownSearchItem({
    super.key,
    required this.onTap,
    required this.subject,
    required this.classTeacher,
    required this.teacherImag,
  });
  final void Function() onTap;

  final String subject;
  final String classTeacher;
  final String teacherImag;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    // double screenWidth = MediaQuery.of(context).size.width;
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
            Flexible(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          'اسم المادة : ',
                          style: FontStyleApp.textStylewite15.copyWith(
                            fontSize: getResponsiveText(context, 15),
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Flexible(
                        child: Text(
                          subject,
                          style: FontStyleApp.textStyleOrange15.copyWith(
                            fontSize: getResponsiveText(context, 15),
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Row(
                    children: [
                      const SizedBox(width: 33),
                      Flexible(
                        child: Text(
                          'صف : ',
                          style: FontStyleApp.textStylewite15.copyWith(
                            fontSize: getResponsiveText(context, 15),
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Flexible(
                        child: Text(
                          classTeacher,
                          style: FontStyleApp.textStyleOrange15.copyWith(
                            fontSize: getResponsiveText(context, 15),
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Flexible(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  teacherImag,
                  height: screenHeight * 0.074,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
