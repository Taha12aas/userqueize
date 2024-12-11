import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:userqueize/Mobile/widgets/log_in_view/statue_border.dart';
import 'package:userqueize/Mobile/widgets/log_in_view/text_field_icons.dart';
import 'package:userqueize/utils/constants.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    required this.hintText,
    required this.iconData,
    this.obscureText = false,
  });
  final String hintText;
  final IconData iconData;
  final bool? obscureText;
  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> obsc = ValueNotifier(true);
    return ValueListenableBuilder(
      valueListenable: obsc,
      child: TextFieldIconS(iconData: iconData),
      builder: (context, value, child) {
        return TextField(
          obscureText: obscureText! ? value : obscureText!,
          style: const TextStyle(fontWeight: FontWeight.bold),
          decoration: InputDecoration(
            hintText: hintText,
            fillColor: Colors.white,
            filled: true,
            prefixIcon: child,
            suffixIcon: obscureText!
                ? IconButton(
                    padding: const EdgeInsets.only(right: 10),
                    onPressed: () {
                      obsc.value = !obsc.value;
                    },
                    icon: Icon(value
                        ? FontAwesomeIcons.eye
                        : FontAwesomeIcons.eyeSlash),
                  )
                : null,
            enabledBorder: statueBorder(Colors.white),
            disabledBorder: statueBorder(Colors.white),
            focusedBorder: statueBorder(kOrangeColor),
          ),
        );
      },
    );
  }
}
