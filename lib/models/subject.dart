class SubjectsGenerated {
  int? id;
  final String nameSubject;
  final String coursesDate;
  final String courses;
  final String nameTeacher;
  final String classSabject;

  SubjectsGenerated(
      {this.id,
      required this.nameSubject,
      required this.coursesDate,
      required this.courses,
      required this.nameTeacher,
      required this.classSabject});

  factory SubjectsGenerated.fromJson(Map<String, dynamic> json) {
    return SubjectsGenerated(
        nameSubject: json['name_sabject'],
        coursesDate: json['courses_date'],
        courses: json['courses'],
        nameTeacher: json['name_teacher'],
        classSabject: json['class']);
  }

  Map<String, dynamic> toJson() {
    return {
      'name_sabject': nameSubject,
      'course_date': coursesDate,
      'courses': courses,
      'name_teacher': nameTeacher,
      'class': classSabject,
    };
  }
}
