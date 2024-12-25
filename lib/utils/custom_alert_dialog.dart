import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userqueize/Mobile/views/home_view.dart';
import 'package:userqueize/Mobile/widgets/log_in_view/custom_button.dart';
import 'package:userqueize/Service/teacher_service.dart';
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
  String? generatedVerificationCode;

  Future<void> _generateVerificationCode(int phoneNumber) async {
    try {
      int? code = await TeacherService.sendVerificationCode(phoneNumber);
      setState(() {
        generatedVerificationCode = code?.toString();
      });
      debugPrint("Generated Code: $generatedVerificationCode");
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        // ignore: use_build_context_synchronously
        showSnackBar(context, 'فشل في إرسال رمز التحقق، حاول مرة أخرى'),
      );
    }
  }

  void _validateCodeAndNavigate(String enteredCode, int phoneUser) async {
    if (enteredCode == generatedVerificationCode) {
      try {
        await TeacherService.updateTeacherVerificationCode(
          phoneUser,
          int.parse(enteredCode),
        );
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          // ignore: use_build_context_synchronously
          showSnackBar(context, 'تم تسجيل الدخول بنجاح'),
        );
        Navigator.pushNamedAndRemoveUntil(
          // ignore: use_build_context_synchronously
          context,
          HomeView.id,
          (route) => false,
        );
      } catch (e) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          // ignore: use_build_context_synchronously
          showSnackBar(context, 'حدث خطأ أثناء التحديث'),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        showSnackBar(context, 'رمز التحقق خاطئ'),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: kOrangeColor, width: 2),
        borderRadius: BorderRadius.circular(16),
      ),
      backgroundColor: kAshenColor,
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
            if (state is LoadingState && generatedVerificationCode == null) {
              // استدعاء الدالة لتوليد رمز التحقق
              _generateVerificationCode(CubitTeacher.user.phone);
            }
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
                activeColor: kOrangeColor,
                inactiveColor: kOrangeColor,
                selectedColor: kOrangeColor,
              ),
              animationDuration: const Duration(milliseconds: 300),
              controller: _pinController,
              keyboardType: TextInputType.number,
              focusNode: _focusNode,
              onChanged: (value) {},
              appContext: context,
              onCompleted: (enteredCode) {
                if (enteredCode.length == 4) {
                  _validateCodeAndNavigate(
                      enteredCode, CubitTeacher.user.phone);
                }
              },
            );
          },
        ),
      ),
      actions: [
        Center(
          child: SizedBox(
            width: 150,
            child: CustomButton(
              onPressed: () {
                String enteredCode = _pinController.text;
                if (enteredCode.length == 4) {
                  _validateCodeAndNavigate(
                      enteredCode, CubitTeacher.user.phone);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    showSnackBar(context, 'من فضلك أدخل رمز التحقق بالكامل'),
                  );
                }
              },
              label: 'موافق',
              iconData: Icons.check,
            ),
          ),
        ),
      ],
    );
  }
}
