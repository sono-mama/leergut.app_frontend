import 'dart:convert';

import 'package:equatable/equatable.dart';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String pastTransactionModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel extends Equatable {
  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.appUserRole,
  });

  final int id;
  final String firstName;
  final String lastName;
  final String username;
  final String email;
  final String appUserRole;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    id: json["id"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    username: json["username"],
    email: json["email"],
    appUserRole: json["appUserRole"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "firstName": firstName,
    "lastName": lastName,
    "username": username,
    "email": email,
    "appUserRole": appUserRole
  };

  @override
  List<Object?> get props => [id, firstName, lastName, username, email, appUserRole];
}


