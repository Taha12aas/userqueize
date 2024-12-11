import 'package:flutter/material.dart';
import 'package:userqueize/utils/constants.dart';
import 'package:userqueize/utils/font_style.dart';
import 'package:userqueize/utils/responsive_text.dart';

class YearQuestions extends StatefulWidget {
  const YearQuestions({
    super.key,
    required this.year,
  });
  final String year;

  @override
  State<YearQuestions> createState() => _YearQuestionsState();
}

class _YearQuestionsState extends State<YearQuestions> {
  bool value = false;
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
              value = !value;
              setState(() {});
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
            widget.year,
            style: FontStyleApp.snakBarLabel.copyWith(
              fontSize: getResponsiveText(context, 18),
            ),
          ),
          const SizedBox(width: 20)
        ],
      ),
    );
  }
}
