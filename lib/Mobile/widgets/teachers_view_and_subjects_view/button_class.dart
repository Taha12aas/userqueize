import 'package:flutter/material.dart';
import 'package:userqueize/utils/constants.dart';
import 'package:userqueize/utils/font_style.dart';
import 'package:userqueize/utils/responsive_text.dart';

class ButtonClass extends StatelessWidget {
  const ButtonClass({
    super.key,
    this.onTap,
    required this.text,
  });
  final void Function()? onTap;
  final String text;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.only(
        left: 5,
      ),
      child: InkWell(
        splashFactory: InkRipple.splashFactory,
        borderRadius: BorderRadius.circular(12),
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
              color: kOrangeBlackColor,
              borderRadius: BorderRadius.circular(12)),
          width: screenWidth * 0.25,
          child: Center(
              child: Text(
            text,
            style: FontStyleApp.orange15
                .copyWith(fontSize: getResponsiveText(context, 15)),
          )),
        ),
      ),
    );
  }
}
