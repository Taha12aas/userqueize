import 'dart:developer';

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:userqueize/models/teacher.dart';

class TeacherService {
  static final SupabaseClient supabase = Supabase.instance.client;

  static Future<List<Map<String, dynamic>>> fetchTeacher(
      int teacherNumber) async {
    final response =
        await supabase.from('teachers').select().eq('phone', teacherNumber);

    log('Response: $response');
    log(response.length.toString());
    return response;
  }

//انشاء مدرس غير لازم الان
  Future<void> createTeacher(Teacher teacher) async {
    try {
      final data = await supabase.from('teachers').insert([teacher.toJson()]);
      log('تمت إضافة البيانات: $data');
    } catch (e) {
      log('حدث خطأ: $e');
      rethrow;
    }
  }

  static Future<void> updateTeacher(
      String columnName, String teacherName, dynamic value) async {
    final data = await supabase
        .from('teachers')
        .update({columnName: value}).eq('name', teacherName);
    log('تمت تعديل البيانات: $data');
  }
}
