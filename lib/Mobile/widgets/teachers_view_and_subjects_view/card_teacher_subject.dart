import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:userqueize/Mobile/widgets/teachers_view_and_subjects_view/row_home_view.dart';
import 'package:userqueize/utils/constants.dart';

class CardTeacherSubject extends StatelessWidget {
  const CardTeacherSubject({
    super.key,
    required this.onTap,
    required this.subject,
    required this.teacherImag,
    required this.classTeacher,
  });

  final void Function() onTap;
  final String subject;
  final String classTeacher;
  final String teacherImag;
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;
    return Bounceable(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: screenHeight * 0.12,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: kAshen,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.5),
              blurRadius: 5.0,
              offset: const Offset(3, 3),
            ),
          ],
          border: Border.all(
            color: kOrangeBlackColor,
            width: 0.5,
          ),
        ),
        child: Row(
          children: [
            const SizedBox(
              width: 5,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                teacherImag,
                height: screenHeight * 0.074,
                width: screenHeight * 0.074,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RowText(
                    classAndSubject: subject,
                    screenWidth: screenWidth,
                    subjectName: ' : اسم المادة',
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  RowText(
                    classAndSubject: classTeacher,
                    screenWidth: screenWidth,
                    subjectName: ': صف',
                  ),
                ],
              ),
            ),
            SizedBox(width: screenWidth * 0.02),
          ],
        ),
      ),
    );
  }
}
