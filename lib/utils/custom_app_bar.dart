import 'package:arabic_font/arabic_font.dart';
import 'package:flutter/material.dart';
import 'package:userqueize/utils/constants.dart';

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
      style: const ArabicTextStyle(
          arabicFont: ArabicFont.aalooBhaijaan, fontSize: 15, color: kWhite),
    ),
    iconTheme: const IconThemeData(
      color: Colors.white,
    ),
  );
}
