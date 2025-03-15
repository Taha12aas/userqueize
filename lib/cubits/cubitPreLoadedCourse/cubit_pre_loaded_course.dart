import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userqueize/Service/pre_loaded_courses.dart';
import 'package:userqueize/cubits/cubitPreLoadedCourse/cubit_pre_loaded_course_status.dart';
import 'package:userqueize/cubits/cubitTeacher/cubit_teacher.dart';
import 'package:userqueize/models/pre_loaded_course.dart';

class CubitPreLoadedCourse extends Cubit<CubitPreLoadedCourseStatus> {
  CubitPreLoadedCourse() : super(InitStatePre());
  static List<PreLoadedCourse> courses = [];
  void fetchPreLoadedCourses() async {
    try {
      emit(LoadingStatePre());
      final result = await PreLoadedCoursesService.fetchPreLoadedCourses(
          CubitTeacher.user.phone);
      for (var i = 0; i < result.length; i++) {
        courses.add(PreLoadedCourse.fromJson(result[i]));
      }

      emit(SuccessStatePre(courses: courses));
    } catch (e) {
      log(e.toString());
      emit(FaliureStatePre());
    }
  }

  void uploadCourse(PreLoadedCourse course) async {
    try {
      emit(LoadingStatePre());
      await PreLoadedCoursesService.uploadCourse(course);
      emit(SuccessStatePre());
    } catch (e) {
      emit(FaliureStatePre());
    }
  }
}
