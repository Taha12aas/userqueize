import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:userqueize/models/subject.dart';

class SubjectService {
  static final SupabaseClient supabase = Supabase.instance.client;

  static Future<List<Map<String, dynamic>>> fetchSubject(
      String teacherName) async {
    final response = await supabase
        .from('subjects_generated')
        .select()
        .eq('name_teacher', teacherName)
        .order('generate_time');

    log('Response: $response');
    log(response.length.toString());
    return response;
  }

  static Future<void> addCourse(SubjectsGenerated subject) async {
    try {
      final data =
          await supabase.from('subjects_generated').insert([subject.toJson()]);
      debugPrint('تمت إضافة البيانات: $data');
    } catch (e) {
      debugPrint('حدث خطأ: $e');
    }
  }
}
