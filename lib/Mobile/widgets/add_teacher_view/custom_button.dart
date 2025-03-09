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
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: kOrangeBlackColor,
          width: 0.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 5.0,
            offset: const Offset(3, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(24),
      ),
      child: Center(
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: kOrange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),
            ),
            minimumSize: Size(
              MediaQuery.of(context).size.width * 0.96,
              MediaQuery.of(context).size.height * 0.057,
            ),
          ),
          child: FittedBox(
            child: Text(
              title,
              style: FontStyleApp.boldWhite15.copyWith(
                fontSize: getResponsiveText(context, 20),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
