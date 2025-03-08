import 'package:flutter/material.dart';
import 'package:userqueize/utils/constants.dart';
import 'package:userqueize/utils/font_style.dart';
import 'package:userqueize/utils/responsive_text.dart';

class CheckBox extends StatefulWidget {
  const CheckBox({
    super.key,
    required this.title,
    required this.isSelected,
    required this.onChanged,
  });
  final String title;
  final void Function(bool?)? onChanged;
  final bool isSelected;
  @override
  State<CheckBox> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          widget.title,
          style: FontStyleApp.orangeBold20.copyWith(
            fontSize: getResponsiveText(context, 18),
          ),
        ),
        Checkbox(
            activeColor: kOrange,
            value: widget.isSelected,
            onChanged: widget.onChanged),
      ],
    );
  }
}
