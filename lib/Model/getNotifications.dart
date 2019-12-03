// To parse this JSON data, do
//
//     final getNotifications = getNotificationsFromJson(jsonString);

import 'dart:convert';

GetNotifications getNotificationsFromJson(String str) =>
    GetNotifications.fromMap(json.decode(str));

String getNotificationsToJson(GetNotifications data) =>
    json.encode(data.toMap());

class GetNotifications {
  int success;
  List<Result> result;
  String message;

  GetNotifications({
    this.success,
    this.result,
    this.message,
  });

  factory GetNotifications.fromMap(Map<String, dynamic> json) =>
      GetNotifications(
        success: json["success"],
        result: List<Result>.from(json["result"].map((x) => Result.fromMap(x))),
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "result": List<dynamic>.from(result.map((x) => x.toMap())),
        "message": message,
      };
}

class Result {
  String notificationId;
  String userId;
  String toUser;
  String notification;
  String crtDate;
  String name;
  String profilePic;

  Result({
    this.notificationId,
    this.userId,
    this.toUser,
    this.notification,
    this.crtDate,
    this.name,
    this.profilePic,
  });

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        notificationId: json["notification_id"],
        userId: json["user_id"],
        toUser: json["to_user"],
        notification: json["notification"],
        crtDate: json["crt_date"],
        name: json["name"],
        profilePic: json["profile_pic"],
      );

  Map<String, dynamic> toMap() => {
        "notification_id": notificationId,
        "user_id": userId,
        "to_user": toUser,
        "notification": notification,
        "crt_date": crtDate,
        "name": name,
        "profile_pic": profilePic,
      };
}
