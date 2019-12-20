// To parse this JSON data, do
//
//     final getSupportLatestMessages = getSupportLatestMessagesFromJson(jsonString);

import 'dart:convert';

GetSupportLatestMessages getSupportLatestMessagesFromJson(String str) =>
    GetSupportLatestMessages.fromMap(json.decode(str));

String getSupportLatestMessagesToJson(GetSupportLatestMessages data) =>
    json.encode(data.toMap());

class GetSupportLatestMessages {
  int success;
  List<Result> result;
  String message;

  GetSupportLatestMessages({
    this.success,
    this.result,
    this.message,
  });

  factory GetSupportLatestMessages.fromMap(Map<String, dynamic> json) =>
      GetSupportLatestMessages(
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
  String day;
  List<Datum> data;

  Result({
    this.day,
    this.data,
  });

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        day: json["day"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "day": day,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class Datum {
  String messageId;
  String userId;
  String message;
  String replyFromSupport;
  String crtDate;
  String supportName;
  String supportPic;
  String messageTimea;

  Datum({
    this.messageId,
    this.userId,
    this.message,
    this.replyFromSupport,
    this.crtDate,
    this.supportName,
    this.supportPic,
    this.messageTimea,
  });

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        messageId: json["message_id"],
        userId: json["user_id"],
        message: json["message"],
        replyFromSupport: json["reply_from_support"],
        crtDate: json["crt_date"],
        supportName: json["support_name"],
        supportPic: json["support_pic"],
        messageTimea: json["message_timea"],
      );

  Map<String, dynamic> toMap() => {
        "message_id": messageId,
        "user_id": userId,
        "message": message,
        "reply_from_support": replyFromSupport,
        "crt_date": crtDate,
        "support_name": supportNameValues.reverse[supportName],
        "support_pic": supportPic,
        "message_timea": messageTimea,
      };
}

enum SupportName { GEOFF_TAYLOR, SFINDIT_SUPPORT }

final supportNameValues = EnumValues({
  "Geoff Taylor": SupportName.GEOFF_TAYLOR,
  "Sfindit Support": SupportName.SFINDIT_SUPPORT
});

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
