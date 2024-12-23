import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:userqueize/Mobile/views/teacher_profile_view.dart';
import 'package:userqueize/utils/constants.dart';
import 'package:userqueize/utils/font_style.dart';
import 'package:userqueize/utils/responsive_text.dart';

class TeacherProfileCard extends StatelessWidget {
  const TeacherProfileCard({
    super.key,
    required this.text,
    required this.image,
  });
  final String text;
  final String image;
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Bounceable(
      onTap: () {
        Navigator.pushNamed(context, TeacherProfileView.id);
      },
      child: Container(
        width: screenWidth * 0.65,
        padding: EdgeInsets.symmetric(vertical: screenWidth * 0.001),
        decoration: BoxDecoration(
          color: kAshenColor,
          borderRadius: BorderRadius.circular(60),
        ),
        child: Row(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Flexible(
                    child: Text(
                      text,
                      style: FontStyleApp.textStylewite15.copyWith(
                        fontSize: getResponsiveText(context, 15),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Flexible(
                    child: Text(
                      ' : الاسم',
                      style: FontStyleApp.textStyleOrange15.copyWith(
                        fontSize: getResponsiveText(context, 15),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            CircleAvatar(
              radius: 30.0,
              backgroundImage: NetworkImage(image),
            ),
          ],
        ),
      ),
    );
  }
}
