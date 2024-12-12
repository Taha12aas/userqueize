import 'package:flutter/material.dart';
import 'package:userqueize/utils/custom_app_bar.dart';

class ChangePasswordView extends StatelessWidget {
  const ChangePasswordView({super.key});
static String id = 'ChangePasswordView';
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: customAppBar('تغيير كلمة المرور', context),
    );
  }
}