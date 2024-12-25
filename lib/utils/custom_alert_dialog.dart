import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userqueize/Mobile/views/home_view.dart';
import 'package:userqueize/Mobile/widgets/log_in_view/custom_button.dart';
import 'package:userqueize/cubits/cubitTeacher/ques_app_status.dart';
import 'package:userqueize/cubits/cubitTeacher/cubit_teacher.dart';
import 'package:userqueize/utils/constants.dart';
import 'package:userqueize/utils/font_style.dart';
import 'package:userqueize/utils/responsive_text.dart';
import 'package:userqueize/utils/show_snack_bar.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> globalKey = GlobalKey();
    List<TextEditingController> controllers =
        List.generate(4, (index) => TextEditingController());
    return Form(
      key: globalKey,
      child: AlertDialog(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        actions: [
          Center(
            child: SizedBox(
              width: 150,
              child: BlocBuilder<CubitTeacher, QuesAppStatus>(
                builder: (context, state) {
                  return CustomButton(
                    onPressed: () {
                      if (globalKey.currentState!.validate()) {
                        String enteredCode =
                            controllers.map((e) => e.text).join();
                        if (state is SuccessState &&
                            state.user!.verificationCode.toString() ==
                                enteredCode) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            showSnackBar(context, 'تم تسجيل الدخول بنجاح'),
                          );
                          Navigator.pushNamedAndRemoveUntil(
                              context, HomeView.id, (route) => false,
                              arguments: state.user!.phone);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            showSnackBar(context, 'رمز التحقق خاطئ'),
                          );
                        }
                      }
                    },
                    label: 'موافق',
                    iconData: Icons.check,
                  );
                },
              ),
            ),
          )
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
        content: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(4, (index) {
            return SizedBox(
              width: 50,
              child: TextFormField(
                controller: controllers[index],
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                maxLength: 1,
                style: FontStyleApp.orange15,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kOrangeColor)),
                  counterText: "",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: kOrangeColor, width: 2),
                  ),
                ),
                onChanged: (value) {
                  if (value.isNotEmpty) {
                    if (index < 3) {
                      FocusScope.of(context).nextFocus();
                    } else if (controllers
                        .every((controller) => controller.text.isNotEmpty)) {
                      String enteredCode =
                          controllers.map((e) => e.text).join();
                      if (BlocProvider.of<CubitTeacher>(context).state
                              is SuccessState &&
                          (BlocProvider.of<CubitTeacher>(context).state
                                      as SuccessState)
                                  .user!
                                  .verificationCode
                                  .toString() ==
                              enteredCode) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          showSnackBar(context, 'تم تسجيل الدخول بنجاح'),
                        );
                        Navigator.pushNamedAndRemoveUntil(
                          context,
                          HomeView.id,
                          (route) => false,
                        );
                      }
                    }
                  } else if (value.isEmpty && index > 0) {
                    FocusScope.of(context).previousFocus();
                  }
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '';
                  }
                  return null;
                },
              ),
            );
          }),
        ),
      ),
    );
  }
}
