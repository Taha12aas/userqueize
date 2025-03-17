import 'package:flutter/material.dart';
import 'package:userqueize/Mobile/widgets/add_teacher_view/text_filed_icon.dart';
import 'package:userqueize/Mobile/widgets/log_in_view/statue_border.dart';
import 'package:userqueize/utils/constants.dart';
import 'package:userqueize/utils/font_style.dart';

class InfoTextField extends StatelessWidget {
  const InfoTextField(
      {super.key,
      required this.iconData,
      this.keyboardType = false,
      this.validator,
      this.initialValue,
      this.controller,
      this.isEnabled = true});
  final IconData iconData;
  final bool? keyboardType;
  final String? initialValue;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool? isEnabled;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      enabled: isEnabled,
      style: const TextStyle(
        color: kBlack,
      ),
      controller: controller,
      initialValue: initialValue,
      validator: validator,
      keyboardType: keyboardType! ? TextInputType.number : null,
      textDirection: TextDirection.rtl,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 1),
        hintTextDirection: TextDirection.rtl,
        hintStyle: const TextStyle(color: kBlack),
        fillColor: Colors.white,
        filled: true,
        suffixIcon: TextFieldIconS(iconData: iconData),
        enabledBorder: statueBorder(kWhite),
        disabledBorder: statueBorder(kWhite),
        focusedBorder: statueBorder(kOrange),
        errorBorder: statueBorder(kred),
        focusedErrorBorder: statueBorder(kred),
        errorStyle: FontStyleApp.orange15,
      ),
    );
  }
}
