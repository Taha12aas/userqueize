import 'package:flutter/material.dart';
import 'package:userqueize/utils/constants.dart';
import 'package:userqueize/utils/font_style.dart';
import 'package:userqueize/utils/responsive_text.dart';

SnackBar showSnackBar(BuildContext context, String content, IconData icon) {
  return SnackBar(
    padding: const EdgeInsets.symmetric(vertical: 6),
    duration: const Duration(seconds: 2),
    shape: const RoundedRectangleBorder(
      side: BorderSide(color: kOrangeColor),
      borderRadius: BorderRadius.all(
        Radius.circular(20),
      ),
    ),
    behavior: SnackBarBehavior.floating,
    content: Row(
      children: [
        const SizedBox(
          width: 10,
        ),
        CircleAvatar(
          backgroundColor: Colors.transparent,
          child: Icon(
            icon,
            color: kOrangeColor,
          ),
        ),
        const Spacer(),
        Text(
          content,
          style: FontStyleApp.whiteBold18.copyWith(
            fontSize: getResponsiveText(context, 15),
          ),
        ),
        const SizedBox(
          width: 10,
        )
      ],
    ),
  );
}
