import 'package:flutter/material.dart';
import 'package:userqueize/utils/font_style.dart';
import 'package:userqueize/utils/responsive_text.dart';

class LogoApp extends StatelessWidget {
  const LogoApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      'Quiz App',
      textAlign: TextAlign.center,
      style: FontStyleApp.orangeBold30
          .copyWith(fontSize: getResponsiveText(context, 30)),
    );
  }
}
