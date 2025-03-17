import 'package:flutter/material.dart';
import 'package:userqueize/utils/constants.dart';
import 'package:userqueize/utils/font_style.dart';
import 'package:userqueize/utils/responsive_text.dart';

SnackBar showSnackBar(BuildContext context, String content, IconData icon) {
  final screenWidth = MediaQuery.of(context).size.width;

  return SnackBar(
    padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
    duration: const Duration(seconds: 2),
    shape: const RoundedRectangleBorder(
      side: BorderSide(color: kOrange),
      borderRadius: BorderRadius.all(
        Radius.circular(20),
      ),
    ),
    behavior: SnackBarBehavior.floating,
    width: screenWidth * 0.9,
    content: IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: kOrange,
            size: 24,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              content,
              style: FontStyleApp.whiteBold18.copyWith(
                fontSize: getResponsiveText(context, 15),
              ),
              maxLines: 3,
            ),
          ),
        ],
      ),
    ),
  );
}
