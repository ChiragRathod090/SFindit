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

  Result({
    this.messageId,
    this.userId,
    this.message,
    this.replyFromSupport,
    this.crtDate,
    this.supportName,
    this.supportPic,
  });

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        messageId: json["message_id"],
        userId: json["user_id"],
        message: json["message"],
        replyFromSupport: json["reply_from_support"],
        crtDate: json["crt_date"],
        supportName: json["support_name"],
        supportPic: json["support_pic"],
      );

  Map<String, dynamic> toMap() => {
        "message_id": messageId,
        "user_id": userId,
        "message": message,
        "reply_from_support": replyFromSupport,
        "crt_date": crtDate,
        "support_name": supportName,
        "support_pic": supportPic,
      };
}
