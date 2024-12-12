import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:userqueize/Mobile/widgets/log_in_view/auth_text_field.dart';
import 'package:userqueize/utils/custom_app_bar.dart';
import 'package:userqueize/utils/font_style.dart';
import 'package:userqueize/utils/responsive_text.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});
  static String id = 'ChangePasswordView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('تغيير كلمة المرور', context),
      body: Column(
        children: [
          Text(
            'تغيير كلمة المرور',
            style: FontStyleApp.labels.copyWith(
              fontSize: getResponsiveText(context, 18),
            ),
          ),
          const AuthTextField(
            hintText: 'كلمة المرور القديمة',
            iconData: FontAwesomeIcons.lock,
            obscureText: true,
          ),
          const SizedBox(
            height: 18,
          ),
          const AuthTextField(
            hintText: 'كلمة المرور الجديدة',
            iconData: FontAwesomeIcons.lock,
            obscureText: true,
          ),
          const SizedBox(
            height: 18,
          ),
          const AuthTextField(
            hintText: 'تأكيد كلمة المرور',
            iconData: FontAwesomeIcons.lock,
            obscureText: true,
          ),
        ],
      ),
    );
  }
}
