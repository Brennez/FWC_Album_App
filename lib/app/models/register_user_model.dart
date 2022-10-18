import 'dart:convert';

class RegisterUserModel {
  final String name;
  final String email;
  final String password;
  final String password_confirmation;

  RegisterUserModel({
    required this.name,
    required this.email,
    required this.password,
    required this.password_confirmation,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'password': password,
      'password_confirmation': password_confirmation,
    };
  }

  factory RegisterUserModel.fromMap(Map<String, dynamic> map) {
    return RegisterUserModel(
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      password_confirmation: map['password_confirmation'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory RegisterUserModel.fromJson(String source) =>
      RegisterUserModel.fromMap(json.decode(source));
}
