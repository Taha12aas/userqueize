
import 'package:flutter/material.dart';
import 'package:userqueize/utils/font_style.dart';
import 'package:userqueize/utils/responsive_text.dart';

class HeaderRow extends StatelessWidget {
  const HeaderRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 2,
          child: Center(
            child: Text(
              'اضغط هنا لرفع دورة',
              style: FontStyleApp.whiteBold18.copyWith(
                fontSize: getResponsiveText(context, 18),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Center(
            child: Text(
              'المادة',
              style: FontStyleApp.whiteBold18.copyWith(
                fontSize: getResponsiveText(context, 18),
              ),
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              'الصف',
              style: FontStyleApp.whiteBold18.copyWith(
                fontSize: getResponsiveText(context, 18),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
