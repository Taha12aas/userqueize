class SubjectsGenerated {
  int? id;
  final String nameSubject;
  final String coursesDate;
  final List<dynamic> courses;
  final String nameTeacher;
  final String classSabject;
  final String seasonSubject;

  SubjectsGenerated(
      {this.id,
      required this.nameSubject,
      required this.coursesDate,
      required this.courses,
      required this.nameTeacher,
      required this.classSabject,
      required this.seasonSubject});

  factory SubjectsGenerated.fromJson(Map<String, dynamic> json) {
    return SubjectsGenerated(
        seasonSubject: json['season_subject'],
        nameSubject: json['name_sabject'],
        coursesDate: json['courses_date'],
        courses: json['courses'],
        nameTeacher: json['name_teacher'],
        classSabject: json['class']);
  }

  Map<String, dynamic> toJson() {
    return {
      'season_subject': seasonSubject,
      'name_sabject': nameSubject,
      'course_date': coursesDate,
      'courses': courses,
      'name_teacher': nameTeacher,
      'class': classSabject,
    };
  }
}
