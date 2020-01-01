// To parse this JSON data, do
//
//     final getTeamListForChat = getTeamListForChatFromJson(jsonString);

import 'dart:convert';

GetTeamListForChat getTeamListForChatFromJson(String str) =>
    GetTeamListForChat.fromMap(json.decode(str));

String getTeamListForChatToJson(GetTeamListForChat data) =>
    json.encode(data.toMap());

class GetTeamListForChat {
  int success;
  List<Result> result;
  String message;

  GetTeamListForChat({
    this.success,
    this.result,
    this.message,
  });

  factory GetTeamListForChat.fromMap(Map<String, dynamic> json) =>
      GetTeamListForChat(
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
  String teamId;
  String teamName;
  String seasonID;
  String playerCount;
  int unReadFlag;
  String comp;

  Result({
    this.teamId,
    this.teamName,
    this.seasonID,
    this.playerCount,
    this.unReadFlag,
    this.comp,
  });

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        teamId: json["teamID"],
        teamName: json["team_name"],
        seasonID: json["seasonID"],
        playerCount: json["player_count"],
        unReadFlag: json["un_read_flag"],
        comp: json["comp"],
      );

  Map<String, dynamic> toMap() => {
        "teamID": teamId,
        "team_name": teamName,
        "seasonID": seasonID,
        "player_count": playerCount,
        "un_read_flag": unReadFlag,
        "comp": comp,
      };
}
