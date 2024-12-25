import 'package:flutter/material.dart';
import 'package:userqueize/utils/constants.dart';
import 'package:userqueize/utils/font_style.dart';

AppBar customAppBar(String title, BuildContext context) {
  return AppBar(
    centerTitle: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(16),
        bottomRight: Radius.circular(16),
      ),
    ),
    backgroundColor: kAshenColor,
    title: Text(
      title,
      style: FontStyleApp.boldwite15.copyWith(fontWeight: FontWeight.w800),
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
  );
}
