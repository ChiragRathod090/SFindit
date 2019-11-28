// To parse this JSON data, do
//
//     final login = loginFromJson(jsonString);

import 'dart:convert';

Login loginFromJson(String str) => Login.fromMap(json.decode(str));

String loginToJson(Login data) => json.encode(data.toMap());

class Login {
  int success;
  Result result;
  String message;

  Login({
    this.success,
    this.result,
    this.message,
  });

  factory Login.fromMap(Map<String, dynamic> json) => Login(
        success: json["success"],
        result: Result.fromMap(json["result"]),
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "result": result.toMap(),
        "message": message,
      };
}

class Result {
  String userId;
  String name;
  String nickname;
  String profilePic;
  String emergencyName;
  String emergencyContact;
  String email;
  String mobile;

  Result({
    this.userId,
    this.name,
    this.nickname,
    this.profilePic,
    this.emergencyName,
    this.emergencyContact,
    this.email,
    this.mobile,
  });

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        userId: json["user_id"],
        name: json["name"],
        nickname: json["nickname"],
        profilePic: json["profile_pic"],
        emergencyName: json["emergency_name"],
        emergencyContact: json["emergency_contact"],
        email: json["email"],
        mobile: json["mobile"],
      );

  Map<String, dynamic> toMap() => {
        "user_id": userId,
        "name": name,
        "nickname": nickname,
        "profile_pic": profilePic,
        "emergency_name": emergencyName,
        "emergency_contact": emergencyContact,
        "email": email,
        "mobile": mobile,
      };
}
