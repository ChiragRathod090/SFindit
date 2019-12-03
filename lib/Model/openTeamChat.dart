// To parse this JSON data, do
//
//     final openTeamChat = openTeamChatFromJson(jsonString);

import 'dart:convert';

OpenTeamChat openTeamChatFromJson(String str) =>
    OpenTeamChat.fromMap(json.decode(str));

String openTeamChatToJson(OpenTeamChat data) => json.encode(data.toMap());

class OpenTeamChat {
  int success;
  List<Result> result;
  String message;

  OpenTeamChat({
    this.success,
    this.result,
    this.message,
  });

  factory OpenTeamChat.fromMap(Map<String, dynamic> json) => OpenTeamChat(
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
  String teamId;
  String userId;
  String message;
  String activeFlag;
  String crtDate;
  String name;
  String nickname;
  String profilePic;
  int sameUser;

  Result({
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

  factory Result.fromMap(Map<String, dynamic> json) => Result(
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
