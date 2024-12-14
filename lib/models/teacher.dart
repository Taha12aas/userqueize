class Teacher {
  int? id;
  final String name;
  final String photo;
  final String phone;
  final String address;
  final String password;
  final String verificationCode;
  final DateTime createdAt;

  Teacher({
    this.id,
    required this.name,
    required this.photo,
    required this.phone,
    required this.address,
    required this.password,
    required this.verificationCode,
    required this.createdAt,
  });

  factory Teacher.fromJson(Map<String, dynamic> json) {
    return Teacher(
      name: json['name'],
      photo: json['photo'],
      phone: json['phone'],
      address: json['address'],
      password: json['password'],
      verificationCode: json['verification_code'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'photo': photo,
      'phone': phone,
      'address': address,
      'password': password,
      'verification_code': verificationCode,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
