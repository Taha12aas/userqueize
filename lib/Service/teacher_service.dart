import 'dart:developer';

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:userqueize/models/teacher.dart';

class TeacherService {
  final SupabaseClient supabase = Supabase.instance.client;

  Future<Teacher?> fetchTeacher() async {
    try {
      final response = await supabase.from('teachers').select();

      log('Response: $response');
    } catch (e) {
      log('Error loading products: $e');
    }
    return null;
  }

//انشاء مدرس غير لازم الان
  Future<void> createTeacher(Teacher teacher) async {
    try {
      final data = await supabase.from('teachers').insert([teacher.toJson()]);
      print('تمت إضافة البيانات: $data');
    } catch (e) {
      print('حدث خطأ: $e');
      rethrow;
    }
  }
}
