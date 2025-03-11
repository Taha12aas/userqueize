
import 'package:flutter/material.dart';
import 'package:userqueize/Mobile/widgets/teather_profile_view/container_courser_upload.dart';
import 'package:userqueize/utils/font_style.dart';
import 'package:userqueize/utils/responsive_text.dart';

class ContainerClassAndSubject extends StatelessWidget {
  const ContainerClassAndSubject({
    super.key,
    required this.classs,
    required this.subject,
    this.color,
  });
  final String classs;
  final String subject;
  final Color? color;
  
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.04,
      color: color,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) {
                  return const ContainerCourserUpload();
                },
              );
            },
            child: Text(
              'اضغط هنا لرفع دورة',
              style: FontStyleApp.orange15
                  .copyWith(fontSize: getResponsiveText(context, 15)),
            ),
          ),
          const Spacer(
            flex: 1,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              subject,
              style: TextStyle(
                  fontSize: getResponsiveText(context, 15),
                  color: Colors.black),
            ),
          ),
          const Spacer(),
          Text(
            classs,
            style: TextStyle(
                fontSize: getResponsiveText(context, 15), color: Colors.black),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
