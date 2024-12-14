
// ignore_for_file: file_names

// تعريف كلاس السؤال
class Question {
  final String questionText; // نص السؤال
  final List<String> options; // قائمة الخيارات

  Question({
    required this.questionText,
    required this.options,
  });

  // تحليل النص وفصل السؤال عن الخيارات
  factory Question.parseFromText(String text) {
    // تقسيم النص باستخدام الأسطر
    List<String> lines = text.split('\n');

    // أول سطر يحتوي على نص السؤال
    String questionText = lines.first.trim();

    // الخيارات تبدأ من السطر الثاني فما بعد
    List<String> options = lines
        .sublist(1)
        .map((line) => line.trim())
        .where((line) => line.isNotEmpty)
        .toList();

    return Question(
      questionText: questionText,
      options: options,
    );
  }
}
