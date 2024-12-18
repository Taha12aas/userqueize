
import 'package:flutter/material.dart';
import 'package:userqueize/utils/font_style.dart';
import 'package:userqueize/utils/responsive_text.dart';

class RowHomeView extends StatelessWidget {
  const RowHomeView({
    super.key,
    required this.classAndSubject,
    required this.screenWidth,
    required this.subjectName,
  });

  final String classAndSubject;
  final double screenWidth;
  final String subjectName;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Flexible(
          child: Text(
            classAndSubject,
            style: FontStyleApp.textStyleOrange15.copyWith(
              fontSize: getResponsiveText(context, 15),
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(width: screenWidth * 0.01),
        Flexible(
          child: Text(
            subjectName,
            style: FontStyleApp.textStylewite15.copyWith(
              fontSize: getResponsiveText(context, 15),
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
