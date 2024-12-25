// ignore_for_file: use_build_context_synchronously

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:userqueize/utils/font_style.dart';
import 'package:userqueize/utils/show_snack_bar.dart';

class ContainerFileUpload extends StatelessWidget {
  const ContainerFileUpload({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    double screenHeight = MediaQuery.sizeOf(context).height;

    return Bounceable(
      onTap: () async {
        FilePickerResult? result = await FilePicker.platform.pickFiles(
          allowMultiple: true,
          type: FileType.custom,
          allowedExtensions: ['pdf'],
        );
        if (result != null) {
          File file = File(result.files.single.path!);
        } else {
          ScaffoldMessenger.of(context)
              .showSnackBar(showSnackBar(context, 'الرجاء اختيار ملف'));
        }
      },
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
              style: FontStyleApp.blackBold16,
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
