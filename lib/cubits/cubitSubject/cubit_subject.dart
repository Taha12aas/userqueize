import 'dart:developer';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userqueize/Service/subject_service.dart';
import 'package:userqueize/cubits/ques_app_status.dart';
import 'package:userqueize/models/subject.dart';

class CubitSubject extends Cubit<QuesAppStatus> {
  CubitSubject() : super(LoadingState());

  void fetchSubject(String teacherName) async {
    try {
      List<Map<String, dynamic>> result =
          await SubjectService.fetchSubject(teacherName);
      SubjectsGenerated subjects = SubjectsGenerated.fromJson(result[0]);
      log('-----------------------------');
      emit(SuccessState(subjects: subjects));
    } catch (e) {
      log(e.toString());
      emit(FaliureState());
    }
  }
}
