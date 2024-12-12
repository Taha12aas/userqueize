import 'package:flutter/material.dart';
import 'package:userqueize/utils/custom_app_bar.dart';

class AddQuestion extends StatelessWidget {
  const AddQuestion({super.key});
  static String id = 'AddQuestion';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('اضافة سؤال', context),
    );
  }
}
