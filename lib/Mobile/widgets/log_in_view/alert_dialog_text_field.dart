import 'package:flutter/material.dart';
import 'package:userqueize/Mobile/widgets/log_in_view/statue_border.dart';
import 'package:userqueize/utils/constants.dart';
import 'package:userqueize/utils/font_style.dart';

class AlertDialogTextField extends StatelessWidget {
  const AlertDialogTextField({
    super.key,
    this.validator,
  });
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
      child: TextFormField(
        textAlign: TextAlign.center,
        validator: validator,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            hintText: '####',
            fillColor: Colors.white,
            filled: true,
            enabledBorder: statueBorder(Colors.white),
            disabledBorder: statueBorder(Colors.white),
            focusedBorder: statueBorder(kOrangeColor),
            errorBorder: statueBorder(Colors.red),
            focusedErrorBorder: statueBorder(Colors.red),
            errorStyle: FontStyleApp.orange15.copyWith()),
      ),
    );
  }
}
