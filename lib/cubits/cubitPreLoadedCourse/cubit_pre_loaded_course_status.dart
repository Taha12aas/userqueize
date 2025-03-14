import 'package:userqueize/models/pre_loaded_course.dart';

abstract class CubitPreLoadedCourseStatus {}

class InitStatePre extends CubitPreLoadedCourseStatus {}

class SuccessStatePre extends CubitPreLoadedCourseStatus {
   List<PreLoadedCourse>? courses;

  SuccessStatePre({ this.courses});
}

class LoadingStatePre extends CubitPreLoadedCourseStatus {}

class FaliureStatePre extends CubitPreLoadedCourseStatus {}
