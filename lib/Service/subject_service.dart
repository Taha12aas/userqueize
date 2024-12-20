import 'dart:developer';

import 'package:supabase_flutter/supabase_flutter.dart';

class SubjectService {
  static final SupabaseClient supabase = Supabase.instance.client;

  static Future<List<Map<String, dynamic>>> fetchSubject(
      String teacherName) async {
    final response = await supabase
        .from('subjects_generated')
        .select()
        .eq('name_teacher', teacherName);

    log('Response: $response');
    log(response.length.toString());
    return response;
  }
}
