import 'package:flutter/material.dart';
import 'package:userqueize/Mobile/widgets/teather_profile_view/container_courser_upload.dart';
import 'package:userqueize/Mobile/widgets/teather_profile_view/header_row%20.dart';
import 'package:userqueize/utils/constants.dart';
import 'package:userqueize/utils/font_style.dart';
import 'package:userqueize/utils/responsive_text.dart';

class ContainerTeacherSubjectsDisplay extends StatelessWidget {
  const ContainerTeacherSubjectsDisplay({
    super.key,
    required this.classes,
    required this.subjects,
  });

  final List<dynamic> classes;
  final List<dynamic> subjects;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.zero,
      width: MediaQuery.of(context).size.width * 0.99,
      height: MediaQuery.of(context).size.height * 0.24,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: kWhite,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 17),
        child: Column(
          children: [
            Container(
              color: kOrange,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                child: HeaderRow(),
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  Table(
                    border:
                        TableBorder.all(color: Colors.grey.withOpacity(0.2)),
                    columnWidths: const {
                      0: FlexColumnWidth(2),
                      1: FlexColumnWidth(1),
                      2: FlexColumnWidth(1),
                    },
                    children: List.generate(classes.length, (index) {
                      final color =
                          index.isEven ? kWhite : const Color(0xffE4E4E4);
                      return TableRow(
                        decoration: BoxDecoration(
                          color: color,
                        ),
                        children: [
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: GestureDetector(
                                onTap: () {
                                  showModalBottomSheet(
                                    context: context,
                                    builder: (context) {
                                      return const ContainerCourserUpload();
                                    },
                                  );
                                },
                                child: Text(
                                  'اضغط هنا لرفع دورة',
                                  style: FontStyleApp.orangeBold20.copyWith(
                                    fontSize: getResponsiveText(context, 18),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                subjects[index].toString(),
                                style: FontStyleApp.blackBold16.copyWith(
                                  fontSize: getResponsiveText(context, 18),
                                ),
                              ),
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                classes[index].toString(),
                                style: FontStyleApp.blackBold16.copyWith(
                                  fontSize: getResponsiveText(context, 18),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
