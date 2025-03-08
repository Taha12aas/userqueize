class Teacher {
  int? id;
  final String name;
  final String photo;
  final int phone;
  final String address;
  final String? password;
  final int verificationCode;
  final Map<String, dynamic> classesSubjects;
  final bool printingPermission;
  Teacher({
    this.id,
    required this.name,
    required this.photo,
    required this.phone,
    required this.address,
    this.password,
    required this.verificationCode,
    required this.classesSubjects,
    required this.printingPermission,
  });

  factory Teacher.fromJson(Map<String, dynamic> json) {
    return Teacher(
      name: json['name'],
      photo: json['photo'],
      phone: json['phone'],
      address: json['address'],
      password: json['password'],
      verificationCode: json['verificationCode'],
      classesSubjects: json['classes_subjects'],
      printingPermission: json['printing_permission'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'photo': photo,
      'phone': phone,
      'address': address,
      'password': password,
      'verificationCode': verificationCode,
      'classes_subjects': classesSubjects,
      'printing_permission': printingPermission
    };
  }
}
