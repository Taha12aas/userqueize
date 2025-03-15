import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userqueize/Mobile/views/reading_pre_loaded_courses_view.dart';
import 'package:userqueize/Mobile/widgets/teachers_view_and_subjects_view/card_subjects.dart';
import 'package:userqueize/cubits/cubitPreLoadedCourse/cubit_pre_loaded_course.dart';
import 'package:userqueize/cubits/cubitPreLoadedCourse/cubit_pre_loaded_course_status.dart';
import 'package:userqueize/utils/custom_app_bar.dart';
import 'package:userqueize/utils/font_style.dart';

class PreLoadedCorsesView extends StatelessWidget {
  const PreLoadedCorsesView({super.key});
  static String id = 'PreLoadedCorsesView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar('الدورات المرفوعة', context),
        body: BlocBuilder<CubitPreLoadedCourse, CubitPreLoadedCourseStatus>(
          builder: (context, state) {
            log(state.toString());
            if (state is SuccessStatePre) {
              return Padding(
                padding: const EdgeInsets.all(18),
                child: ListView.builder(
                  itemCount: CubitPreLoadedCourse.courses.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: CardSubjects(
                        courseDate:
                            CubitPreLoadedCourse.courses[index].courseHistory,
                        seasonSubject:
                            CubitPreLoadedCourse.courses[index].season,
                        subject:
                            CubitPreLoadedCourse.courses[index].subjectName,
                        classTeacher:
                            CubitPreLoadedCourse.courses[index].subjectClass,
                        onTap: () {
                          Navigator.pushNamed(
                            arguments: [
                              CubitPreLoadedCourse.courses[index].courseHistory,
                              CubitPreLoadedCourse.courses[index].season,
                              CubitPreLoadedCourse.courses[index].subjectName,
                              CubitPreLoadedCourse.courses[index].subjectClass,
                            ],
                            context,
                            ReadingPreLoadedCoursesView.id,
                          );
                        },
                      ),
                    );
                  },
                ),
              );
            } else {
              return const Center(
                child: Text(
                  'لا يوجد اسئلة',
                  style: FontStyleApp.orangeBold20,
                ),
              );
            }
          },
        ));
  }
}
