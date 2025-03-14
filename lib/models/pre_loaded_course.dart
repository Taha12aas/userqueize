class PreLoadedCourse {
  final List<dynamic> courses;
  final String subjectName;
  final String courseHistory;
  final int teacherPhone;
  final String season;

  PreLoadedCourse(
      {required this.courses,
      required this.subjectName,
      required this.courseHistory,
      required this.teacherPhone,
      required this.season});

  factory PreLoadedCourse.fromJson(json) {
    return PreLoadedCourse(
        courses: json['course'],
        subjectName: json['cubject_name'],
        courseHistory: json['Course_history'],
        teacherPhone: json['teacher_phone'],
        season: json['season']);
  }
    Map<String, dynamic> toJson() {
    return {
      'course': courses,
      'cubject_name': subjectName,
      'Course_history': courseHistory,
      'teacher_phone': teacherPhone,
      'season': season,
    };
  }
}

