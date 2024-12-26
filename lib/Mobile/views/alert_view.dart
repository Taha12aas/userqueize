import 'package:flutter/material.dart';
import 'package:userqueize/utils/custom_alert_dialog.dart';
import 'package:userqueize/utils/custom_app_bar.dart';

class AlertView extends StatelessWidget {
  const AlertView({super.key});
  static String id = 'AlertView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('رمز التحقق', context),
      body: const CustomAlertDialog(),
    );
  }
}
