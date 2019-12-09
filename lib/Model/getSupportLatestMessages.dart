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
  List<Latestmessage> latestmessage;
  String message;

  GetSupportLatestMessages({
    this.success,
    this.latestmessage,
    this.message,
  });

  factory GetSupportLatestMessages.fromMap(Map<String, dynamic> json) =>
      GetSupportLatestMessages(
        success: json["success"],
        latestmessage: List<Latestmessage>.from(
            json["latestmessage"].map((x) => Latestmessage.fromMap(x))),
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "latestmessage":
            List<dynamic>.from(latestmessage.map((x) => x.toMap())),
        "message": message,
      };
}

class Latestmessage {
  String messageId;
  String userId;
  String message;
  String replyFromSupport;
  String crtDate;
  String supportName;
  String supportPic;

  Latestmessage({
    this.messageId,
    this.userId,
    this.message,
    this.replyFromSupport,
    this.crtDate,
    this.supportName,
    this.supportPic,
  });

  factory Latestmessage.fromMap(Map<String, dynamic> json) => Latestmessage(
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
