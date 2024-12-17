import 'package:flutter/material.dart';
import 'package:userqueize/utils/custom_alert_dialog.dart';

Future<dynamic> showAlertDialogAndNavigate(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return const CustomAlertDialog();
    },
  );
}
