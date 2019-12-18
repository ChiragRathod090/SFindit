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
  Result result;
  String message;

  GetLatestMessages({
    this.success,
    this.result,
    this.message,
  });

  factory GetLatestMessages.fromMap(Map<String, dynamic> json) =>
      GetLatestMessages(
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
  List<Message> messages;
  List<dynamic> upcomingMatch;

  Result({
    this.messages,
    this.upcomingMatch,
  });

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        messages:
            List<Message>.from(json["messages"].map((x) => Message.fromMap(x))),
        upcomingMatch: List<dynamic>.from(json["upcoming_match"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "messages": List<dynamic>.from(messages.map((x) => x.toMap())),
        "upcoming_match": List<dynamic>.from(upcomingMatch.map((x) => x)),
      };
}

class Message {
  String messageId;
  String teamId;
  String userId;
  String message;
  String activeFlag;
  String crtDate;
  Name name;
  Nickname nickname;
  String profilePic;
  int sameUser;
  String messageTime;

  Message({
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
    this.messageTime,
  });

  factory Message.fromMap(Map<String, dynamic> json) => Message(
        messageId: json["message_id"],
        teamId: json["team_id"],
        userId: json["user_id"],
        message: json["message"],
        activeFlag: json["active_flag"],
        crtDate: json["crt_date"],
        name: nameValues.map[json["name"]],
        nickname: nicknameValues.map[json["nickname"]],
        profilePic: json["profile_pic"],
        sameUser: json["same_user"],
        messageTime: json["message_time"],
      );

  Map<String, dynamic> toMap() => {
        "message_id": messageId,
        "team_id": teamId,
        "user_id": userId,
        "message": message,
        "active_flag": activeFlag,
        "crt_date": crtDate,
        "name": nameValues.reverse[name],
        "nickname": nicknameValues.reverse[nickname],
        "profile_pic": profilePic,
        "same_user": sameUser,
        "message_time": messageTime,
      };
}

enum Name { GEOFF_TAYLOR, ALANNA_MYERS }

final nameValues = EnumValues(
    {"Alanna Myers": Name.ALANNA_MYERS, "Geoff Taylor": Name.GEOFF_TAYLOR});

enum Nickname { GEOFF_T, ALANNA_M }

final nicknameValues =
    EnumValues({"Alanna M": Nickname.ALANNA_M, "Geoff T": Nickname.GEOFF_T});

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
