// To parse this JSON data, do
//
//     final getLatestMessages = getLatestMessagesFromJson(jsonString);

import 'dart:convert';

GetLatestMessages getLatestMessagesFromJson(String str) =>
    GetLatestMessages.fromMap(json.decode(str));

String getLatestMessagesToJson(GetLatestMessages data) =>
    json.encode(data.toMap());

class GetLatestMessages {
  int success;
  List<Latestmessage> latestmessages;
  String message;

  GetLatestMessages({
    this.success,
    this.latestmessages,
    this.message,
  });

  factory GetLatestMessages.fromMap(Map<String, dynamic> json) =>
      GetLatestMessages(
        success: json["success"],
        latestmessages: List<Latestmessage>.from(
            json["latestmessages"].map((x) => Latestmessage.fromMap(x))),
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "latestmessages":
            List<dynamic>.from(latestmessages.map((x) => x.toMap())),
        "message": message,
      };
}

class Latestmessage {
  String messageId;
  String teamId;
  String userId;
  String message;
  String activeFlag;
  String crtDate;
  String name;
  String nickname;
  String profilePic;
  int sameUser;

  Latestmessage({
    this.messageId,
    this.teamId,
    this.userId,
    this.message,
    this.activeFlag,
    this.crtDate,
    this.name,
    this.nickname,
    this.profilePic,
    this.sameUser,
  });

  factory Latestmessage.fromMap(Map<String, dynamic> json) => Latestmessage(
        messageId: json["message_id"],
        teamId: json["team_id"],
        userId: json["user_id"],
        message: json["message"],
        activeFlag: json["active_flag"],
        crtDate: json["crt_date"],
        name: json["name"],
        nickname: json["nickname"],
        profilePic: json["profile_pic"],
        sameUser: json["same_user"],
      );

  Map<String, dynamic> toMap() => {
        "message_id": messageId,
        "team_id": teamId,
        "user_id": userId,
        "message": message,
        "active_flag": activeFlag,
        "crt_date": crtDate,
        "name": name,
        "nickname": nickname,
        "profile_pic": profilePic,
        "same_user": sameUser,
      };
}
