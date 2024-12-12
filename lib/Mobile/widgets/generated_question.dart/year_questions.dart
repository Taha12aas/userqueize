import 'package:flutter/material.dart';
import 'package:userqueize/utils/constants.dart';
import 'package:userqueize/utils/font_style.dart';
import 'package:userqueize/utils/responsive_text.dart';

class YearQuestions extends StatelessWidget {
  const YearQuestions({
    super.key,
    required this.year,
    required this.value,
    required this.onChanged,
  });

  final String year;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * .06,
      decoration: BoxDecoration(
        color: kAshenColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          const SizedBox(width: 10),
          IconButton(
            onPressed: () {
              onChanged(!value);
            },
            icon: value
                ? const Icon(
                    Icons.file_download_done,
                    color: Colors.white,
                  )
                : const Icon(
                    Icons.cloud_download_rounded,
                    color: Colors.white,
                  ),
          ),
          const Spacer(),
          Text(
            year,
            style: FontStyleApp.textStyleWhiteBold18.copyWith(
              fontSize: getResponsiveText(context, 18),
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
    );
  }
}
