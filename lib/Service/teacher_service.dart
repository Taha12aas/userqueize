import 'dart:math';

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:userqueize/models/teacher.dart';

class TeacherService {
  static final SupabaseClient supabase = Supabase.instance.client;

  static Future<List<Map<String, dynamic>>> fetchTeacher(
      int teacherNumber) async {
    final response =
        await supabase.from('teachers').select().eq('phone', teacherNumber);

    print('Response: $response');
    print(response.length.toString());
    return response;
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

  static Future<void> updateTeacher(
      String columnName, String teacherName, dynamic value) async {
    final data = await supabase
        .from('teachers')
        .update({columnName: value}).eq('name', teacherName);
    print('تمت تعديل البيانات: $data');
  }

  static Future<void> sendVerificationCode(int phoneNumber) async {
    try {
      // توليد رمز تحقق عشوائي مكون من 6 أرقام
      int verificationCode = Random().nextInt(900000) + 100000;
      await updateTeacherVerificationCode(phoneNumber, verificationCode);
      // إرسال رسالة عبر WhatsApp
      // ignore: unused_local_variable
      String message = 'Your verification code is: $verificationCode';
      // await sendWhatsAppMessage(phoneNumber.toString(), message);

      // تحقق من أن قيمة رمز التحقق صحيحة
      print('تم إنشاء رمز التحقق: $verificationCode');

      // تخزين رمز التحقق في قاعدة البيانات
    } catch (e) {
      print('حدث خطأ أثناء إرسال رمز التحقق: $e');
    }
  }

  // دالة لتخزين رمز التحقق في قاعدة البيانات
  static Future<void> updateTeacherVerificationCode(
      int teacherPhone, int verificationCode) async {
    try {
      // تحقق من أن القيمة لا تكون null
      final response = await supabase
          .from('teachers')
          .update({'verificationCode': verificationCode})
          .eq('phone', teacherPhone)
          .select();

      // طباعة الاستجابة لمعرفة ما إذا تم التحديث بنجاح
      if (response.isNotEmpty) {
        print('تم تحديث رمز التحقق في قاعدة البيانات: $response');
      } else {
        print(
            'لم تتم إضافة رمز التحقق في قاعدة البيانات. تحقق من الرقم المدخل.');
      }
        } catch (e) {
      print('حدث خطأ أثناء تحديث رمز التحقق في قاعدة البيانات: $e');
    }
  }

}
