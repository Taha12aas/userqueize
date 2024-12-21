import 'package:flutter/material.dart';
import 'package:userqueize/utils/font_style.dart';
import 'package:userqueize/utils/responsive_text.dart';

class RegisterOrLogIn extends StatelessWidget {
  const RegisterOrLogIn({
    super.key,
    required this.label1,
    required this.label2, required this.onPressed,
  });
  final String label1;
  final String label2;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: onPressed,
          child: Text(
            label2,
            style: FontStyleApp.textStyleOrangeBold15.copyWith(
              fontSize: getResponsiveText(context, 12),
            ),
          ),
        ),
        Text(
          label1,
          style: FontStyleApp.textStyleWhiteBold18.copyWith(
            fontSize: getResponsiveText(context, 12),
          ),
        ),
      ],
    );
  }
}
