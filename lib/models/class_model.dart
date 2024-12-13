class ClassModel {
  final int id;
  final String name;
  final DateTime createdAt;

  ClassModel({
    required this.id,
    required this.name,
    required this.createdAt,
  });


  factory ClassModel.fromJson(Map<String, dynamic> json) {
    return ClassModel(
      id: json['id'],
      name: json['name'],
      createdAt: DateTime.parse(json['created_at']),
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'created_at': createdAt.toIso8601String(),
    };
  }
}
