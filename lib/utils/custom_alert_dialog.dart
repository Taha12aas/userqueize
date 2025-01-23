import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userqueize/Mobile/views/home_view.dart';
import 'package:userqueize/Mobile/widgets/log_in_view/custom_button.dart';
import 'package:userqueize/cubits/cubitTeacher/cubit_teacher.dart';
import 'package:userqueize/cubits/cubitTeacher/ques_app_status.dart';
import 'package:userqueize/utils/constants.dart';
import 'package:userqueize/utils/font_style.dart';
import 'package:userqueize/utils/responsive_text.dart';
import 'package:userqueize/utils/show_snack_bar.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CustomAlertDialog extends StatefulWidget {
  const CustomAlertDialog({super.key});

  @override
  State<CustomAlertDialog> createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends State<CustomAlertDialog> {
  final TextEditingController _pinController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: kOrange, width: 2),
        borderRadius: BorderRadius.circular(16),
      ),
      backgroundColor: kAshen,
      title: Text(
        'أدخل رمز التحقق',
        textAlign: TextAlign.center,
        style: FontStyleApp.whiteBold18.copyWith(
          fontSize: getResponsiveText(context, 18),
        ),
      ),
      content: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: BlocBuilder<CubitTeacher, QuesAppStatus>(
          builder: (context, state) {
            return PinCodeTextField(
              length: 4,
              obscureText: false,
              animationType: AnimationType.fade,
              pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(8),
                fieldHeight: 50,
                fieldWidth: 50,
                activeFillColor: Colors.white,
                inactiveFillColor: Colors.transparent,
                selectedFillColor: Colors.transparent,
                activeColor: kOrange,
                inactiveColor: kOrange,
                selectedColor: kOrange,
              ),
              animationDuration: const Duration(milliseconds: 300),
              controller: _pinController,
              keyboardType: TextInputType.number,
              focusNode: _focusNode,
              appContext: context,
              onCompleted: (enteredCode) {
                checkVerificationCode(context);
              },
            );
          },
        ),
      ),
      actions: [
        Center(
          child: SizedBox(
            width: 150,
            child: CustomButtonIcon(
              onPressed: () {
                checkVerificationCode(context);
              },
              label: 'موافق',
              iconData: Icons.check,
            ),
          ),
        ),
      ],
    );
  }

  void checkVerificationCode(BuildContext context) {
    if (_pinController.text.length == 4 &&
        _pinController.text == CubitTeacher.verificationCode.toString()) {
      Navigator.pushNamedAndRemoveUntil(context, HomeView.id, (route) => false);
      ScaffoldMessenger.of(context).showSnackBar(
        showSnackBar(context, 'تمت العملبة بنجاح', Icons.check),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        showSnackBar(context, 'من فضلك أدخل رمز التحقق بالكامل', Icons.error),
      );
    }
  }
}
