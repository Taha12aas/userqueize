import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GeneratorService {
  static String apiKey = 'sec_uWjdLp0J5NRzojgjE8pb4NgU6Xxspdkc'; // مفتاح API
  static String uploadUrl = 'https://api.chatpdf.com/v1/sources/add-file';
  static String chatUrl = 'https://api.chatpdf.com/v1/chats/message';

  static Future<String> uploadAndSendMessage(File file, String message) async {
    try {
      // رفع الملف
      var request = http.MultipartRequest('POST', Uri.parse(uploadUrl))
        ..headers['x-api-key'] = apiKey
        ..files.add(await http.MultipartFile.fromPath('file', file.path));

      var uploadResponse = await request.send();

      if (uploadResponse.statusCode == 200) {
        var uploadData = await uploadResponse.stream.bytesToString();
        var sourceId = jsonDecode(uploadData)['sourceId'];

        // إرسال الرسالة
        var chatResponse = await http.post(
          Uri.parse(chatUrl),
          headers: {
            'Content-Type': 'application/json',
            'x-api-key': apiKey,
          },
          body: jsonEncode({
            'sourceId': sourceId,
            'messages': [
              {'role': 'user', 'content': message},
            ],
          }),
        );

        if (chatResponse.statusCode == 200) {
          var chatData = jsonDecode(chatResponse.body);
          return chatData['content'];
        } else {
          return 'فشل في إرسال الرسالة: ${chatResponse.body}';
        }
      } else {
        var errorResponse = await uploadResponse.stream.bytesToString();
        return 'فشل في رفع الملف: $errorResponse';
      }
    } catch (e) {
      return 'حدث خطأ أثناء العملية: $e';
    }
  }
}
