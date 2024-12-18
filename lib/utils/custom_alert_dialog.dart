import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userqueize/Mobile/views/home_view.dart';
import 'package:userqueize/Mobile/widgets/log_in_view/alert_dialog_text_field.dart';
import 'package:userqueize/Mobile/widgets/log_in_view/custom_button.dart';
import 'package:userqueize/cubits/ques_app_status.dart';
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
    int code = 0;
    return Form(
      key: globalKey,
      child: AlertDialog(
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 73, vertical: 15),
        actions: [
          Center(
            child: SizedBox(
              width: 150,
              child: BlocBuilder<CubitTeacher, QuesAppStatus>(
                builder: (context, state) {
                  return CustomButton(
                    onPressed: () {
                      if (globalKey.currentState!.validate()) {
                        if (state is SuccessState) {
                          if (state.user!.verificationCode == code) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              showSnackBar(context, 'تم تسجيل الدخول بنجاح'),
                            );
                            Navigator.pushNamedAndRemoveUntil(
                                context, HomeView.id, (route) => false);
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                              showSnackBar(context, 'رمز التحقق خاطئ'));
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
          style: FontStyleApp.textStyleWhiteBold18.copyWith(
            fontSize: getResponsiveText(context, 18),
          ),
        ),
        content: AlertDialogTextField(
          validator: (codee) {
            if (codee!.length == 6) {
              code = int.parse(codee);
              return null;
            } else {
              return 'اربع ارقام';
            }
          },
        ),
      ),
    );
  }
}
