// To parse this JSON data, do
//
//     final openTeamChat = openTeamChatFromJson(jsonString);

import 'dart:convert';

OpenTeamChat openTeamChatFromJson(String str) =>
    OpenTeamChat.fromMap(json.decode(str));

String openTeamChatToJson(OpenTeamChat data) => json.encode(data.toMap());

class OpenTeamChat {
  int success;
  Result result;
  String message;

  OpenTeamChat({
    this.success,
    this.result,
    this.message,
  });

  factory OpenTeamChat.fromMap(Map<String, dynamic> json) => OpenTeamChat(
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
  List<UpcomingMatch> upcomingMatch;

  Result({
    this.messages,
    this.upcomingMatch,
  });

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        messages:
            List<Message>.from(json["messages"].map((x) => Message.fromMap(x))),
        upcomingMatch: List<UpcomingMatch>.from(
            json["upcoming_match"].map((x) => UpcomingMatch.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "messages": List<dynamic>.from(messages.map((x) => x.toMap())),
        "upcoming_match":
            List<dynamic>.from(upcomingMatch.map((x) => x.toMap())),
      };
}

class Message {
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
  });

  factory Message.fromMap(Map<String, dynamic> json) => Message(
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
        "name": nameValues.reverse[name],
        "nickname": nicknameValues.reverse[nickname],
        "profile_pic": profilePic,
        "same_user": sameUser,
      };
}

enum Name { GEOFF_TAYLOR, ALANNA_MYERS }

final nameValues = EnumValues(
    {"Alanna Myers": Name.ALANNA_MYERS, "Geoff Taylor": Name.GEOFF_TAYLOR});

enum Nickname { GEOFF_TAYLOR_S, ALANNA_M }

final nicknameValues = EnumValues(
    {"Alanna M": Nickname.ALANNA_M, "Geoff Taylor's": Nickname.GEOFF_TAYLOR_S});

class UpcomingMatch {
  String matchId;
  String calendarId;
  String divisionId;
  String venue;
  String home;
  String away;
  String overwrite;
  String datestamp;
  String oponentName;
  String seasonName;
  String playStatus;

  UpcomingMatch({
    this.matchId,
    this.calendarId,
    this.divisionId,
    this.venue,
    this.home,
    this.away,
    this.overwrite,
    this.datestamp,
    this.oponentName,
    this.seasonName,
    this.playStatus,
  });

  factory UpcomingMatch.fromMap(Map<String, dynamic> json) => UpcomingMatch(
        matchId: json["match_id"],
        calendarId: json["calendar_id"],
        divisionId: json["division_id"],
        venue: json["venue"],
        home: json["home"],
        away: json["away"],
        overwrite: json["overwrite"],
        datestamp: json["datestamp"],
        oponentName: json["oponent_name"],
        seasonName: json["season_name"],
        playStatus: json["play_status"],
      );

  Map<String, dynamic> toMap() => {
        "match_id": matchId,
        "calendar_id": calendarId,
        "division_id": divisionId,
        "venue": venue,
        "home": home,
        "away": away,
        "overwrite": overwrite,
        "datestamp": datestamp,
        "oponent_name": oponentName,
        "season_name": seasonName,
        "play_status": playStatus,
      };
}

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
