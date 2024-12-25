import 'package:flutter/material.dart';
import 'package:userqueize/Mobile/widgets/add_teacher_view/horizontal_divider.dart';
import 'package:userqueize/Mobile/widgets/add_teacher_view/info_text_field.dart';
import 'package:userqueize/utils/font_style.dart';
import 'package:userqueize/utils/responsive_text.dart';

class ColumnTeacherInfo extends StatelessWidget {
  const ColumnTeacherInfo({
    super.key,
    required this.labelText,
    required this.initialValue,
    required this.iconData,
    required this.horizntalSize,
    this.keyboardType = false,
    this.validator,
  });
  final double horizntalSize;
  final String labelText;
  final String initialValue;
  final IconData iconData;
  final bool? keyboardType;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            labelText,
            textAlign: TextAlign.end,
            style: FontStyleApp.whiteBold18
                .copyWith(fontSize: getResponsiveText(context, 18)),
          ),
          HorizontalDivider(
            size: horizntalSize,
          ),
          const SizedBox(
            height: 5,
          ),
          InfoTextField(
            initialValue: initialValue,
            validator: validator,
            iconData: iconData,
            keyboardType: keyboardType,
          )
        ],
      ),
    );
  }
}
