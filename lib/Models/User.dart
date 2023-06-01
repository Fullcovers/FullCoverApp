import 'dart:convert';

class User {
  final String id;
  final Map<String, String> name;
  final String email;
  final String password;
  final String phoneNumber;
  final String role;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.role,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': {
        'firstName': name['firstName'],
        'lastName': name['lastName'],
      },
      'email': email,
      'password': password,
      'phoneNumber': phoneNumber,
      'role': role,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['_id'] ?? '',
      name: {
        'firstName': map['name'] != null ? map['name']['firstName'] ?? '' : '',
        'lastName': map['name'] != null ? map['name']['lastName'] ?? '' : '',
      },
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      role: map['role'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
