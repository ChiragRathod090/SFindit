// To parse this JSON data, do
//
//     final getSupportMessages = getSupportMessagesFromJson(jsonString);

import 'dart:convert';

GetSupportMessages getSupportMessagesFromJson(String str) =>
    GetSupportMessages.fromMap(json.decode(str));

String getSupportMessagesToJson(GetSupportMessages data) =>
    json.encode(data.toMap());

class GetSupportMessages {
  int success;
  List<Result> result;
  String message;

  GetSupportMessages({
    this.success,
    this.result,
    this.message,
  });

  factory GetSupportMessages.fromMap(Map<String, dynamic> json) =>
      GetSupportMessages(
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
  String messageId;
  String userId;
  String message;
  String replyFromSupport;
  String crtDate;
  String supportName;
  String supportPic;
  String messageTimea;

  Result({
    this.messageId,
    this.userId,
    this.message,
    this.replyFromSupport,
    this.crtDate,
    this.supportName,
    this.supportPic,
    this.messageTimea,
  });

  factory Result.fromMap(Map<String, dynamic> json) => Result(
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

enum SupportName { EMPTY, SFINDIT_SUPPORT }

final supportNameValues = EnumValues(
    {"": SupportName.EMPTY, "Sfindit Support": SupportName.SFINDIT_SUPPORT});

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
