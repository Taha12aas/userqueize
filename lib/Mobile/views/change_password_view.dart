import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:userqueize/Mobile/views/home_view.dart';
import 'package:userqueize/Mobile/widgets/add_teacher_view/custom_button.dart';
import 'package:userqueize/Mobile/widgets/log_in_view/auth_text_field.dart';
import 'package:userqueize/utils/custom_alert_dialog.dart';
import 'package:userqueize/utils/custom_app_bar.dart';
import 'package:userqueize/utils/font_style.dart';
import 'package:userqueize/utils/responsive_text.dart';
import 'package:userqueize/utils/show_snack_bar.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});
  static String id = 'ChangePasswordView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('تغيير كلمة المرور', context),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'تغيير كلمة المرور',
                    style: FontStyleApp.textStyleWhiteBold18.copyWith(
                      fontSize: getResponsiveText(context, 24),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'كلمة المرور القديمة',
                style: FontStyleApp.textStyleWhiteBold18.copyWith(
                  fontSize: getResponsiveText(context, 16),
                ),
              ),
              const AuthTextField(
                hintText: 'كلمة المرور القديمة',
                iconData: FontAwesomeIcons.lock,
              ),
              const SizedBox(
                height: 18,
              ),
              Text(
                'كلمة المرور الجديدة',
                style: FontStyleApp.textStyleWhiteBold18.copyWith(
                  fontSize: getResponsiveText(context, 16),
                ),
              ),
              const AuthTextField(
                hintText: 'كلمة المرور الجديدة',
                iconData: FontAwesomeIcons.lock,
              ),
              const SizedBox(
                height: 18,
              ),
              Text(
                'تأكيد كلمة المرور',
                style: FontStyleApp.textStyleWhiteBold18.copyWith(
                  fontSize: getResponsiveText(context, 16),
                ),
              ),
              const AuthTextField(
                hintText: 'تأكيد كلمة المرور',
                iconData: FontAwesomeIcons.lock,
              ),
              const SizedBox(
                height: 18,
              ),
              CustomButton(
                title: 'حفظ',
                onPressed: () {
                  showAlertDialogAndNavigate(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> showAlertDialogAndNavigate(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return CustomAlertDialog(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              showSnackBar(context, 'تم تغيير كلمة المرور بنجاح'),
            );
            Navigator.pushNamedAndRemoveUntil(
              context,
              HomeView.id,
              (route) => false,
            );
          },
        );
      },
    );
  }
}
