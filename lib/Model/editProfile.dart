// To parse this JSON data, do
//
//     final editProfileResponse = editProfileResponseFromJson(jsonString);

import 'dart:convert';

EditProfileResponse editProfileResponseFromJson(String str) =>
    EditProfileResponse.fromMap(json.decode(str));

String editProfileResponseToJson(EditProfileResponse data) =>
    json.encode(data.toMap());

class EditProfileResponse {
  Result result;
  int success;
  String message;

  EditProfileResponse({
    this.result,
    this.success,
    this.message,
  });

  factory EditProfileResponse.fromMap(Map<String, dynamic> json) =>
      EditProfileResponse(
        result: Result.fromMap(json["result"]),
        success: json["success"],
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "result": result.toMap(),
        "success": success,
        "message": message,
      };
}

class Result {
  String profilePic;

  Result({
    this.profilePic,
  });

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        profilePic: json["profile_pic"],
      );

  Map<String, dynamic> toMap() => {
        "profile_pic": profilePic,
      };
}
