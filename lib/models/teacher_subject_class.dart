class TeacherSubjectClass {
  final int id;
  final int teacherId;
  final int subjectId;
  final int classId;
  final String teacherName;
  final String subjectName;
  final String className;
  final DateTime createdAt;

  TeacherSubjectClass({
    required this.id,
    required this.teacherId,
    required this.subjectId,
    required this.classId,
    required this.teacherName,
    required this.subjectName,
    required this.className,
    required this.createdAt,
  });

  
  factory TeacherSubjectClass.fromJson(Map<String, dynamic> json) {
    return TeacherSubjectClass(
      id: json['id'],
      teacherId: json['teacher_id'],
      subjectId: json['subject_id'],
      classId: json['class_id'],
      teacherName: json['teacher_name'],
      subjectName: json['subject_name'],
      className: json['class_name'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'teacher_id': teacherId,
      'subject_id': subjectId,
      'class_id': classId,
      'teacher_name': teacherName,
      'subject_name': subjectName,
      'class_name': className,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
