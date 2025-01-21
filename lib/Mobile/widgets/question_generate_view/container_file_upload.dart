// ignore_for_file: use_build_context_synchronously


import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:userqueize/utils/font_style.dart';
import 'package:userqueize/utils/responsive_text.dart';

class ContainerFileUpload extends StatelessWidget {
  const ContainerFileUpload({
    super.key,
    required this.onTap,
  });
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    double screenHeight = MediaQuery.sizeOf(context).height;
    return Bounceable(
      onTap: onTap,
      child: Container(
        width: screenWidth * 0.9,
        height: screenHeight * 0.27,
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.cloud_upload,
              size: 50,
              color: Colors.black,
            ),
            const SizedBox(height: 10),
            Text(
              'اسحب او اختر ملف',
              style: FontStyleApp.blackBold16.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: getResponsiveText(context, 16),
              ),
            ),
            const SizedBox(height: 20),
            Flexible(
              child: TextButton(
                onPressed: onTap,
                style: TextButton.styleFrom(
                  backgroundColor: Colors.black,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                child: const Text(
                  'Browse files',
                  style: TextStyle(
                    color: Colors.orange, // لون النص
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
