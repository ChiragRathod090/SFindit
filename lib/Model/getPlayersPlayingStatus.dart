// To parse this JSON data, do
//
//     final getPlayersPlayingStatus = getPlayersPlayingStatusFromJson(jsonString);

import 'dart:convert';

GetPlayersPlayingStatus getPlayersPlayingStatusFromJson(String str) =>
    GetPlayersPlayingStatus.fromMap(json.decode(str));

String getPlayersPlayingStatusToJson(GetPlayersPlayingStatus data) =>
    json.encode(data.toMap());

class GetPlayersPlayingStatus {
  int success;
  List<Playingstatus> playingstatus;
  String message;

  GetPlayersPlayingStatus({
    this.success,
    this.playingstatus,
    this.message,
  });

  factory GetPlayersPlayingStatus.fromMap(Map<String, dynamic> json) =>
      GetPlayersPlayingStatus(
        success: json["success"],
        playingstatus: List<Playingstatus>.from(
            json["playingstatus"].map((x) => Playingstatus.fromMap(x))),
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "playingstatus":
            List<dynamic>.from(playingstatus.map((x) => x.toMap())),
        "message": message,
      };
}

class Playingstatus {
  String indId;
  String name;
  String profilePic;
  int playStatus;

  Playingstatus({
    this.indId,
    this.name,
    this.profilePic,
    this.playStatus,
  });

  factory Playingstatus.fromMap(Map<String, dynamic> json) => Playingstatus(
        indId: json["indID"],
        name: json["name"],
        profilePic: json["profile_pic"],
        playStatus: json["play_status"],
      );

  Map<String, dynamic> toMap() => {
        "indID": indId,
        "name": name,
        "profile_pic": profilePic,
        "play_status": playStatus,
      };
}
