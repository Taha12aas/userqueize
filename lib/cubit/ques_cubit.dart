
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userqueize/Service/teacher_service.dart';
import 'package:userqueize/cubit/ques_app_status.dart';
import 'package:userqueize/models/teacher.dart';

class QuesCubit extends Cubit<QuesAppStatus> {
  QuesCubit() : super(LoadingState());

  void fetchUsers(String teacherName) async {
    try {
      dynamic result = await TeacherService.fetchTeacher(teacherName);
      Teacher user = Teacher.fromJson(result);
      emit(SuccessState(user: user));
    } catch (e) {
      emit(FaliureState());
    }
  }

  void updateUsers(String columnName, String teacherName, dynamic value) async {
    try {
      await TeacherService.updateTeacher(columnName, teacherName, value);
      emit(SuccessState());
    } catch (e) {
      emit(FaliureState());
    }
  }
  
}
