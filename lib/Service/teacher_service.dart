import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:userqueize/Service/send_code.dart';

class TeacherService {
  static final SupabaseClient supabase = Supabase.instance.client;

  static Future<List<Map<String, dynamic>>> fetchTeacher(
      int teacherNumber) async {
    final response =
        await supabase.from('teachers').select().eq('phone', teacherNumber);

    debugPrint('Response: $response');
    debugPrint(response.length.toString());
    return response;
  }

//انشاء مدرس غير لازم الان
  // Future<void> createTeacher(Teacher teacher) async {
  //   try {
  //     final data = await supabase.from('teachers').insert([teacher.toJson()]);
  //     debugPrint('تمت إضافة البيانات: $data');
  //   } catch (e) {
  //     debugPrint('حدث خطأ: $e');
  //     rethrow;
  //   }
  // }

  static Future<void> updateTeacher(
      String columnName, String teacherName, dynamic value) async {
    final data = await supabase
        .from('teachers')
        .update({columnName: value}).eq('name', teacherName);
    debugPrint('تمت تعديل البيانات: $data');
  }
static Future<String> uploadImage(File imageFile, int phoneUser) async {
  try {
    final String fileName = 'user_$phoneUser/${DateTime.now().millisecondsSinceEpoch}.jpg';
    debugPrint("🚀 محاولة رفع الصورة إلى: $fileName");

    // رفع الصورة
    final response = await supabase.storage.from('img').upload(
          fileName,
          imageFile,
          fileOptions: const FileOptions(contentType: 'image/jpeg'),
        );

    debugPrint("✅ استجابة الرفع: $response");

    // الحصول على الرابط العام
    final String publicUrl = supabase.storage.from('img').getPublicUrl(fileName);
    debugPrint("✅ الصورة تم رفعها بنجاح: $publicUrl");

    // تحديث رابط الصورة في جدول المدرسين مع إرجاع الاستجابة
    final updateResponse = await supabase
        .from('teachers')
        .update({'photo': publicUrl})
        .eq('phone', phoneUser)
        .select() // أضف هذا السطر!
        .single(); // للحصول على استجابة واحدة

    debugPrint("✅ تم تحديث السجل: ${updateResponse['photo']}");

    return publicUrl;
  } on PostgrestException catch (e) {
    debugPrint('❌ خطأ في قاعدة البيانات: ${e.message}');
    throw Exception('فشل في التحديث: ${e.message}');
  } catch (e) {
    debugPrint('❌ خطأ غير متوقع: $e');
    throw Exception('فشل في العملية: $e');
  }
}

  // ignore: body_might_complete_normally_nullable
  static Future<int?> sendVerificationCode(int phoneNumber) async {
    try {
      // توليد رمز تحقق عشوائي مكون من 4 أرقام
      int verificationCode = Random().nextInt(9000) + 1000;
      await updateTeacherVerificationCode(phoneNumber, verificationCode);
      // إرسال رسالة عبر WhatsApp

      // ignore: unused_local_variable
      String message = 'Your verification code is: $verificationCode';
      await sendWhatsAppMessage(phoneNumber.toString(), message);
      // تحقق من أن قيمة رمز التحقق صحيحة
      debugPrint('تم إنشاء رمز التحقق: $verificationCode');
      return verificationCode;
      // تخزين رمز التحقق في قاعدة البيانات
    } catch (e) {
      debugPrint('حدث خطأ أثناء إرسال رمز التحقق: $e');
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
        debugPrint('تم تحديث رمز التحقق في قاعدة البيانات: $response');
      } else {
        debugPrint(
            'لم تتم إضافة رمز التحقق في قاعدة البيانات. تحقق من الرقم المدخل.');
      }
    } catch (e) {
      debugPrint('حدث خطأ أثناء تحديث رمز التحقق في قاعدة البيانات: $e');
    }
  }
}
