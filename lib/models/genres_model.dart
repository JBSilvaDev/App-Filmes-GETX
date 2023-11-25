import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class GenresModel {
  final int id;
  final String name;
  GenresModel({
    required this.id,
    required this.name,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory GenresModel.fromMap(Map<String, dynamic> map) {
    return GenresModel(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory GenresModel.fromJson(String source) => GenresModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
