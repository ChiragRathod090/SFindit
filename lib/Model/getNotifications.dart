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
  Result result;
  String message;

  GetNotifications({
    this.success,
    this.result,
    this.message,
  });

  factory GetNotifications.fromMap(Map<String, dynamic> json) =>
      GetNotifications(
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
  List<Datum> data;
  String firstPage;
  String lastPage;
  String prevPage;
  String nextPage;
  String currentPage;
  String total;

  Result({
    this.data,
    this.firstPage,
    this.lastPage,
    this.prevPage,
    this.nextPage,
    this.currentPage,
    this.total,
  });

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
        firstPage: json["first_page"],
        lastPage: json["last_page"],
        prevPage: json["prev_page"],
        nextPage: json["next_page"],
        currentPage: json["current_page"],
        total: json["total"],
      );

  Map<String, dynamic> toMap() => {
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
        "first_page": firstPage,
        "last_page": lastPage,
        "prev_page": prevPage,
        "next_page": nextPage,
        "current_page": currentPage,
        "total": total,
      };
}

class Datum {
  String notificationId;
  String userId;
  String toUser;
  String notification;
  String crtDate;
  String name;
  String profilePic;

  Datum({
    this.notificationId,
    this.userId,
    this.toUser,
    this.notification,
    this.crtDate,
    this.name,
    this.profilePic,
  });

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
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
        "crt_date": crtDateValues.reverse[crtDate],
        "name": nameValues.reverse[name],
        "profile_pic": profilePic,
      };
}

enum CrtDate { THE_16122019 }

final crtDateValues = EnumValues({"16/12/2019": CrtDate.THE_16122019});

enum Name { LORNA_STUBBS }

final nameValues = EnumValues({"Lorna   Stubbs": Name.LORNA_STUBBS});

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
