import 'package:flutter/material.dart';
import 'package:userqueize/utils/font_style.dart';

class ContainerFileUpload extends StatelessWidget {
  const ContainerFileUpload({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    double screenHeight = MediaQuery.sizeOf(context).height;

    return InkWell(
      borderRadius: BorderRadius.circular(7),
      onTap: () {},
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
            const Text(
              'اسحب او اختر ملف',
              style: FontStyleApp.textStyleBold16,
            ),
            const SizedBox(height: 20),
            Flexible(
              child: TextButton(
                onPressed: () {},
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
