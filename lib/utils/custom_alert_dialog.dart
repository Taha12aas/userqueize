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

  // // متغير لتخزين رمز التحقق المولد
  // String? generatedVerificationCode;

  // دالة لتوليد رمز التحقق
  // Future<void> _generateVerificationCode(int phoneNumber) async {
  //   int? code = await TeacherService.sendVerificationCode(phoneNumber);
  //   setState(() {
  //     generatedVerificationCode = code.toString(); // تخزين الرمز كمتحول نصي
  //   });
  //   debugPrint("Generated Code: $generatedVerificationCode");
  // }

  // دالة للتحقق من الرمز المدخل
  void _validateCodeAndNavigate(String enteredCode, SuccessState state) async {
    if (enteredCode == '1111') {
      // تحديث حالة التحقق في قاعدة البيانات
      await TeacherService.updateTeacherVerificationCode(
          state.user!.phone, int.parse(enteredCode));

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
        arguments: state.user!.phone,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        showSnackBar(context, 'رمز التحقق خاطئ'),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: AlertDialog(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        actions: [
          Center(
            child: SizedBox(
              width: 150,
              child: BlocBuilder<CubitTeacher, QuesAppStatus>(
                builder: (context, state) {
                  if (state is SuccessState) {
                    // توليد رمز التحقق عند فتح الحوار
                    // if (generatedVerificationCode == null) {
                    //   _generateVerificationCode(state.user!.phone);
                    // }
                    return CustomButton(
                      onPressed: () {
                        String enteredCode = _pinController.text;
                        if (enteredCode.length == 4) {
                          _validateCodeAndNavigate(enteredCode, state);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            showSnackBar(
                                context, 'من فضلك أدخل رمز التحقق بالكامل'),
                          );
                        }
                      },
                      label: 'موافق',
                      iconData: Icons.check,
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
          ),
        ],
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
              if (state is SuccessState) {
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
                      _validateCodeAndNavigate(enteredCode, state);
                    }
                  },
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
