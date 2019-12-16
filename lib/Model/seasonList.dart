// To parse this JSON data, do
//
//     final getSeasonList = getSeasonListFromJson(jsonString);

import 'dart:convert';

GetSeasonList getSeasonListFromJson(String str) =>
    GetSeasonList.fromMap(json.decode(str));

String getSeasonListToJson(GetSeasonList data) => json.encode(data.toMap());

class GetSeasonList {
  int success;
  List<Result> result;
  String message;

  GetSeasonList({
    this.success,
    this.result,
    this.message,
  });

  factory GetSeasonList.fromMap(Map<String, dynamic> json) => GetSeasonList(
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
  String id;
  String name;
  String seasonal;
  String sfindit;
  String sfinditInchat;
  String current;
  String type;

  Result({
    this.id,
    this.name,
    this.seasonal,
    this.sfindit,
    this.sfinditInchat,
    this.current,
    this.type,
  });

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        id: json["id"],
        name: json["name"],
        seasonal: json["seasonal"],
        sfindit: json["sfindit"],
        sfinditInchat: json["sfindit_inchat"],
        current: json["current"],
        type: json["type"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "seasonal": seasonal,
        "sfindit": sfindit,
        "sfindit_inchat": sfinditInchat,
        "current": current,
        "type": type,
      };
}
