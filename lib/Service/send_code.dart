import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> sendWhatsAppMessage(String phoneNumber, String message) async {
  String apiUrl = 'https://api.ultramsg.com/instance101876/messages/chat';  // استبدل your_instance_id برقم الحساب الخاص بك من Ultramsg
  String apiToken = 'b3xtonezc1dsotpa'; // استبدل هذا بكود API الخاص بك

  Map<String, String> headers = {
    'Content-Type': 'application/json',
  };

  Map<String, dynamic> body = {
    "token": apiToken,
    "to": phoneNumber,
    "body": message,
  };

  var response = await http.post(
    Uri.parse(apiUrl),
    headers: headers,
    body: json.encode(body),
  );

  if (response.statusCode == 200) {
    print('Message sent successfully');
  } else {
    print('Failed to send message: ${response.body}');
  }
}
