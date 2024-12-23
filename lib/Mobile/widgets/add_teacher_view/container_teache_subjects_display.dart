import 'package:flutter/material.dart';
import 'package:userqueize/Mobile/widgets/add_teacher_view/container_class_and_subject.dart';
import 'package:userqueize/utils/constants.dart';
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
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 17),
        child: Column(
          children: [
            Container(
              color: kOrangeColor,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Spacer(
                    flex: 4,
                  ),
                  Text(
                    'المادة',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: getResponsiveText(context, 16),
                        color: Colors.white),
                  ),
                  const Spacer(),
                  Text('الصف',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: getResponsiveText(context, 16),
                          color: Colors.white)),
                  const Spacer(
                    flex: 1,
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: classes.length,
                itemBuilder: (context, index) {
                  final color =
                      index.isEven ? Colors.white : const Color(0xffE4E4E4);
                  return ContainerClassAndSubject(
                      color: color,
                      classs: classes[index],
                      subject: subjects[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
