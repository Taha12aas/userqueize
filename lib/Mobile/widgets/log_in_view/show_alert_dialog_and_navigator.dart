
  import 'package:flutter/material.dart';
import 'package:userqueize/Mobile/views/home_view.dart';
import 'package:userqueize/utils/custom_alert_dialog.dart';
import 'package:userqueize/utils/show_snack_bar.dart';

Future<dynamic> showAlertDialogAndNavigate(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return CustomAlertDialog(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              showSnackBar(context, 'تم تسجيل الدخول بنجاح'),
            );
            Navigator.pushNamedAndRemoveUntil(
                context, HomeView.id, (route) => false);
          },
        );
      },
    );
  }

