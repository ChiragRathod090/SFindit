// To parse this JSON data, do
//
//     final getTeamsList = getTeamsListFromJson(jsonString);

import 'dart:convert';

GetTeamsList getTeamsListFromJson(String str) =>
    GetTeamsList.fromMap(json.decode(str));

String getTeamsListToJson(GetTeamsList data) => json.encode(data.toMap());

class GetTeamsList {
  int success;
  List<Result> result;
  String message;

  GetTeamsList({
    this.success,
    this.result,
    this.message,
  });

  factory GetTeamsList.fromMap(Map<String, dynamic> json) => GetTeamsList(
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
  String teamName;
  String teamId;
  String playerCount;

  Result({
    this.teamName,
    this.teamId,
    this.playerCount,
  });

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        teamName: json["team_name"],
        teamId: json["teamID"],
        playerCount: json["player_count"],
      );

  Map<String, dynamic> toMap() => {
        "team_name": teamName,
        "teamID": teamId,
        "player_count": playerCount,
      };
}
