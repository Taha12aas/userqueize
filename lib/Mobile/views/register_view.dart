import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:userqueize/Mobile/views/log_in_view.dart';
import 'package:userqueize/Mobile/widgets/log_in_view/auth_text_field.dart';
import 'package:userqueize/Mobile/widgets/log_in_view/custom_button.dart';
import 'package:userqueize/Mobile/widgets/log_in_view/logo_image.dart';
import 'package:userqueize/Mobile/widgets/log_in_view/register_or_log_in.dart';
import 'package:userqueize/utils/custom_alert_dialog.dart';
import 'package:userqueize/utils/font_style.dart';
import 'package:userqueize/utils/responsive_text.dart';
import 'package:userqueize/utils/show_snack_bar.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});
  static String id = 'RegisterView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints:
              BoxConstraints(minHeight: MediaQuery.sizeOf(context).height),
          child: IntrinsicHeight(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  const LogoImage(),
                  const SizedBox(height: 40),
                  Text(
                    'Quiz App',
                    textAlign: TextAlign.center,
                    style: FontStyleApp.appName
                        .copyWith(fontSize: getResponsiveText(context, 30)),
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        'انشاء حساب',
                        textAlign: TextAlign.end,
                        style: FontStyleApp.labels
                            .copyWith(fontSize: getResponsiveText(context, 18)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 18),
                  const AuthTextField(
                    hintText: 'رقم الهاتف',
                    iconData: FontAwesomeIcons.phone,
                  ),
                  const SizedBox(height: 18),
                  const AuthTextField(
                    hintText: 'كلمة المرور',
                    iconData: FontAwesomeIcons.lock,
                    obscureText: true,
                  ),
                  const SizedBox(height: 18),
                  const AuthTextField(
                    hintText: 'تأكيد كلمة المرور',
                    iconData: FontAwesomeIcons.lock,
                    obscureText: true,
                  ),
                  RegisterOrLogIn(
                    label1: 'لديك حساب؟',
                    label2: 'اضغط هنا لتسجيل الدخول',
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  const Spacer(),
                  CustomButton(
                    iconData: Icons.login,
                    label: 'انشاء حساب',
                    onPressed: () {
                      showAlertDialogAndNavigate(context);
                    },
                  ),
                  const SizedBox(height: 65),
                ],
              ),
            ),
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
              showSnackBar(context, 'تم انشاء الحساب بنجاح'),
            );
            Navigator.pushNamedAndRemoveUntil(
              context,
              LogInView.id,
              (route) => false,
            );
          },
        );
      },
    );
  }
}
