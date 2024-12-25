import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:userqueize/utils/constants.dart';
import 'package:userqueize/utils/font_style.dart';
import 'package:userqueize/utils/responsive_text.dart';

//Container الموجود في الصفحة الرئيسة
class MainCategoriesSection extends StatelessWidget {
  const MainCategoriesSection(
      {super.key,
      required this.label,
      required this.image,
      required this.onTap});

  final String label;
  final String image;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Bounceable(
      onTap: onTap,
      child: Container(
        width: screenWidth * 0.40,
        decoration: BoxDecoration(
          color: kAshenColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(image, height: screenHeight * 0.08),
              const SizedBox(height: 10),
              Text(
                label,
                style: FontStyleApp.orangeBold25.copyWith(
                  fontSize: getResponsiveText(context, 23),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
