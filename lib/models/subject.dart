class Subject {
  final int id;
  final String name;
  final DateTime courseDate;
  final String courseContents;
  final DateTime createdAt;

  Subject({
    required this.id,
    required this.name,
    required this.courseDate,
    required this.courseContents,
    required this.createdAt,
  });

  factory Subject.fromJson(Map<String, dynamic> json) {
    return Subject(
      id: json['id'],
      name: json['name'],
      courseDate: DateTime.parse(json['course_date']),
      courseContents: json['course_contents'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'course_date': courseDate.toIso8601String(),
      'course_contents': courseContents,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
