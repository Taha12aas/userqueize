import 'package:flutter/material.dart';
import 'package:font_awesome_icon_class/font_awesome_icon_class.dart';
import 'package:userqueize/Mobile/widgets/add_teacher_view/custom_button.dart';
import 'package:userqueize/Mobile/widgets/log_in_view/auth_text_field.dart';

import 'package:userqueize/utils/custom_app_bar.dart';
import 'package:userqueize/utils/font_style.dart';
import 'package:userqueize/utils/responsive_text.dart';
import 'package:userqueize/utils/show_alert_dialog_and_navigate.dart';

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
                  Flexible(
                    child: Text(
                      ': تغيير كلمة المرور',
                      style: FontStyleApp.textStyleWhiteBold18.copyWith(
                        fontSize: getResponsiveText(context, 22),
                      ),
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
              const SizedBox(
                height: 10,
              ),
              AuthTextField(
                validator: (p0) {},
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
              const SizedBox(
                height: 10,
              ),
              /// TODO Edit
              AuthTextField(
                validator: (p0) {
                  return null;
                },
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
              const SizedBox(
                height: 10,
              ),
              AuthTextField(
                validator: (p0) {
                  return null;
                },
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
}
