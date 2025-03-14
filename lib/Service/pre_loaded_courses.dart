import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:userqueize/models/pre_loaded_course.dart';

class PreLoadedCoursesService {
  static final SupabaseClient supabase = Supabase.instance.client;
   
  static Future<List<Map<String, dynamic>>> fetchPreLoadedCourses(
      int teacherNumber) async {
    final response = await supabase
        .from('pre_loaded_course')
        .select()
        .eq('teacher_phone', teacherNumber);

    debugPrint('Response: $response');
    debugPrint(response.length.toString());
    return response;
  }

  static Future<void> uploadCourse(PreLoadedCourse preLoadedCourse) async {
    try {
      final data = await supabase
          .from('pre_loaded_course')
          .insert([preLoadedCourse.toJson()]);
      debugPrint('تمت إضافة البيانات: $data');
    } catch (e) {
      debugPrint('حدث خطأ: $e');
      rethrow;
    }
  }
}
