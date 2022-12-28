import 'dart:convert';

class User {
  final String id;
  final String firstName;
  final String name;
  final String cpf;
  final String email;

  User(
      {required this.id,
      required this.firstName,
      required this.name,
      required this.cpf,
      required this.email});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'cpf': cpf,
      'firstName': firstName
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['user']['id'] ?? '',
      name: map['user']['name'] ?? '',
      email: map['user']['email'] ?? '',
      cpf: map['user']['cpf'] ?? '',
      firstName: map['user']['firstName'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
