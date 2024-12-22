import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userqueize/Service/subject_service.dart';
import 'package:userqueize/cubits/cubitSubject/cubit_subject_status.dart';
import 'package:userqueize/models/subject.dart';


class CubitSubject extends Cubit<CubitSubjectStatus> {
  CubitSubject() : super(LoadingStatee());

  void fetchSubject(String teacherName) async {
    try {
      List<Map<String, dynamic>> result =
          await SubjectService.fetchSubject(teacherName);

      List<SubjectsGenerated> subjectsCount = [];

      for (var i = 0; i < result.length; i++) {
        subjectsCount.add(SubjectsGenerated.fromJson(result[i]));
      }
      log('--------------Subjects---------------');
      emit(SuccessStatee(subjects: subjectsCount));
    } catch (e) {
      log(e.toString());
      emit(FaliureStatee());
    }
  }
}
