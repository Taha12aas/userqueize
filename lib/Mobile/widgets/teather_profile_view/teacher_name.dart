import 'package:flutter/material.dart';
import 'package:userqueize/utils/constants.dart';
import 'package:userqueize/utils/font_style.dart';
import 'package:userqueize/utils/responsive_text.dart';

class TeacherName extends StatelessWidget {
  const TeacherName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            padding: const EdgeInsets.only(top: 8),
            onPressed: () {},
            icon: const Icon(
              Icons.app_registration_rounded,
              color: kOrangeColor,
            )),
        Flexible(
          child: Text(
            'طه الفاخوري',
            style: FontStyleApp.textStyleWhiteBold18.copyWith(
              fontSize: getResponsiveText(context, 16),
            ),
          ),
        ),
        const SizedBox(
          width: 15,
        ),
      ],
    );
  }
}
