import 'package:flutter/material.dart';
import 'package:userqueize/Mobile/widgets/add_teacher_view/drop_down_check_subject.dart';
import 'package:userqueize/Mobile/widgets/question_generate_view/container_file_upload.dart';
import 'package:userqueize/utils/custom_app_bar.dart';
import 'package:userqueize/utils/font_style.dart';
import 'package:userqueize/utils/responsive_text.dart';

class CoursersUploadView extends StatelessWidget {
  const CoursersUploadView({super.key});
  static String id = 'CoursersUploadView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar('رفع الدورات', context),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ContainerFileUpload(
                onTap: () {},
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      Text(
                        'الصف',
                        style: FontStyleApp.orangeBold20
                            .copyWith(fontSize: getResponsiveText(context, 18)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        height: 100,
                        width: 100,
                        child: DropdownCheckSubject(
                          items: [
                            'taha',
                          ],
                        ),
                      )
                    ],
                  ),  
                  Column(
                    children: [
                      Text(
                        'اسم المادة',
                        style: FontStyleApp.orangeBold20
                            .copyWith(fontSize: getResponsiveText(context, 18)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        height: 100,
                        width: 100,
                        child: DropdownCheckSubject(
                          items: [
                            'taha',
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      Text(
                        'الفصل',
                        style: FontStyleApp.orangeBold20
                            .copyWith(fontSize: getResponsiveText(context, 18)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        height: 100,
                        width: 100,
                        child: DropdownCheckSubject(
                          items: [
                            'taha',
                          ],
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
