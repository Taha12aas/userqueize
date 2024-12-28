import 'package:flutter/material.dart';
import 'package:userqueize/utils/constants.dart';
import 'package:userqueize/utils/font_style.dart';
import 'package:userqueize/utils/responsive_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.title,
    required this.onPressed,
  });
  final String title;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: kOrangeColor,
          minimumSize: Size(MediaQuery.of(context).size.width * 0.96,
              MediaQuery.of(context).size.height * 0.057)),
      child: Text(
        title,
        style: FontStyleApp.boldWhite15
            .copyWith(fontSize: getResponsiveText(context, 20)),
      ),
    );
  }
}
