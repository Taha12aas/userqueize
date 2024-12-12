import 'package:flutter/material.dart';
import 'package:userqueize/Mobile/widgets/add_teacher_view/text_filed_icon.dart';
import 'package:userqueize/Mobile/widgets/log_in_view/statue_border.dart';
import 'package:userqueize/utils/constants.dart';

class InfoTextField extends StatelessWidget {
  const InfoTextField({
    super.key,
    required this.hintText,
    required this.iconData,
    this.keyboardType = false,
  });
  final String hintText;
  final IconData iconData;
  final bool? keyboardType;
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType! ? TextInputType.number : null,
      textDirection: TextDirection.rtl,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 1),
        hintTextDirection: TextDirection.rtl,
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.black),
        fillColor: Colors.white,
        filled: true,
        suffixIcon: TextFieldIconS(iconData: iconData),
        enabledBorder: statueBorder(Colors.white),
        disabledBorder: statueBorder(Colors.white),
        focusedBorder: statueBorder(kOrangeColor),
      ),
    );
  }
}
