import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userqueize/Mobile/widgets/home_view/main_sections.dart';
import 'package:userqueize/Mobile/widgets/teachers_view_and_subjects_view/card_subjects.dart';
import 'package:userqueize/cubits/cubitSubject/cubit_Subject.dart';
import 'package:userqueize/cubits/ques_app_status.dart';
import 'package:userqueize/utils/font_style.dart';
import 'package:userqueize/utils/main_app_bar.dart';
import 'package:userqueize/utils/responsive_text.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});
  static String id = 'HomeView';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: mainAppBar('الصفحة الرئيسية', context),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const MainSections(),
            const SizedBox(height: 20),
            Text(
              ' :  أحدث النشاطات',
              style: FontStyleApp.textStyleOrangeBold25.copyWith(
                fontSize: getResponsiveText(context, 25),
              ),
            ),
            const SizedBox(height: 10),
            BlocBuilder<CubitSubject, QuesAppStatus>(
              builder: (context, state) {
                if (state is SuccessState) {
                  return Expanded(
                      child: ListView.builder(
                    itemCount: state.subjects!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: CardSubjects(
                          onTap: () {},
                          subject: state.subjects![index].nameSubject,
                          teacherImag: 'assets/images/subjects.png',
                          classTeacher: state.subjects![index].classSabject,
                        ),
                      );
                    },
                  ));
                } else {
                  return const Text(
                    'لا يوجد اسئلة',
                    style: FontStyleApp.textStyleOrangeBold20,
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
