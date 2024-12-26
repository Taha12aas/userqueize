import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userqueize/Service/teacher_service.dart';
import 'package:userqueize/cubits/cubitTeacher/ques_app_status.dart';
import 'package:userqueize/models/teacher.dart';

class CubitTeacher extends Cubit<QuesAppStatus> {
  CubitTeacher() : super(LoadingState());

  static late Teacher user;
  static int? verificationCode;
  void fetchUsers(int teacherNumber) async {
    try {
      List<Map<String, dynamic>> result =
          await TeacherService.fetchTeacher(teacherNumber);
      user = Teacher.fromJson(result[0]);
      log('------------Fetch User Data-----------------');
      emit(SuccessState(user: user));
    } catch (e) {
      log(e.toString());
      emit(FaliureState());
    }
  }

  void updateUsers(String columnName, String teacherName, dynamic value) async {
    try {
      await TeacherService.updateTeacher(columnName, teacherName, value);
      emit(LoadingState());
    } catch (e) {
      emit(FaliureState());
    }
  }

  void generateCode(int phoneNumber) async {
    try {
      verificationCode = await TeacherService.sendVerificationCode(phoneNumber);
      emit(LoadingState());
    } catch (e) {
      emit(FaliureState());
    }
  }
}
