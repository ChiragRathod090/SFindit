// To parse this JSON data, do
//
//     final getLaddersFixtures = getLaddersFixturesFromJson(jsonString);

import 'dart:convert';

GetLaddersFixtures getLaddersFixturesFromJson(String str) =>
    GetLaddersFixtures.fromMap(json.decode(str));

String getLaddersFixturesToJson(GetLaddersFixtures data) =>
    json.encode(data.toMap());

class GetLaddersFixtures {
  int success;
  ResultData resultData;
  String message;

  GetLaddersFixtures({
    this.success,
    this.resultData,
    this.message,
  });

  factory GetLaddersFixtures.fromMap(Map<String, dynamic> json) =>
      GetLaddersFixtures(
        success: json["success"],
        resultData: ResultData.fromMap(json["resultData"]),
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "resultData": resultData.toMap(),
        "message": message,
      };
}

class ResultData {
  List<Datum> ladderData;
  List<Datum> fixtureData;
  List<dynamic> dayWiseData;
  int toShowRound;
  List<dynamic> rounds;

  ResultData({
    this.ladderData,
    this.fixtureData,
    this.dayWiseData,
    this.toShowRound,
    this.rounds,
  });

  factory ResultData.fromMap(Map<String, dynamic> json) => ResultData(
        ladderData:
            List<Datum>.from(json["ladderData"].map((x) => Datum.fromMap(x))),
        fixtureData: List<Datum>.from(json["fixtureData"]
            .map((x) => x == null ? null : Datum.fromMap(x))),
        dayWiseData: List<dynamic>.from(json["dayWiseData"].map((x) => x)),
        toShowRound: json["toShowRound"],
        rounds: List<dynamic>.from(json["rounds"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "ladderData": List<dynamic>.from(ladderData.map((x) => x.toMap())),
        "fixtureData": List<dynamic>.from(
            fixtureData.map((x) => x == null ? null : x.toMap())),
        "dayWiseData": List<dynamic>.from(dayWiseData.map((x) => x)),
        "toShowRound": toShowRound,
        "rounds": List<dynamic>.from(rounds.map((x) => x)),
      };
}

class Datum {
  String id;
  String did;
  String win;
  String loss;
  String draw;
  String forfeited;
  String gf;
  String ga;
  String gp;
  String mp;
  String pp;
  String teamid;
  String teamName;
  dynamic divisionName;
  dynamic seasonName;
  dynamic day;
  dynamic competitionType;
  dynamic sportName;
  dynamic venue;
  String status;
  String g;
  String m;
  String p;
  int toShowFirst;
  List<dynamic> fixtures;

  Datum({
    this.id,
    this.did,
    this.win,
    this.loss,
    this.draw,
    this.forfeited,
    this.gf,
    this.ga,
    this.gp,
    this.mp,
    this.pp,
    this.teamid,
    this.teamName,
    this.divisionName,
    this.seasonName,
    this.day,
    this.competitionType,
    this.sportName,
    this.venue,
    this.status,
    this.g,
    this.m,
    this.p,
    this.toShowFirst,
    this.fixtures,
  });

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        id: json["id"],
        did: json["did"],
        win: json["win"],
        loss: json["loss"],
        draw: json["draw"],
        forfeited: json["forfeited"],
        gf: json["gf"],
        ga: json["ga"],
        gp: json["gp"],
        mp: json["mp"],
        pp: json["pp"],
        teamid: json["teamid"],
        teamName: json["team_name"],
        divisionName: json["division_name"],
        seasonName: json["season_name"],
        day: json["day"],
        competitionType: json["competition_type"],
        sportName: json["sport_name"],
        venue: json["venue"],
        status: json["status"],
        g: json["g%"],
        m: json["m%"],
        p: json["p%"],
        toShowFirst: json["toShowFirst"],
        fixtures: List<dynamic>.from(json["fixtures"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "did": did,
        "win": win,
        "loss": loss,
        "draw": draw,
        "forfeited": forfeited,
        "gf": gf,
        "ga": ga,
        "gp": gp,
        "mp": mp,
        "pp": pp,
        "teamid": teamid,
        "team_name": teamName,
        "division_name": divisionName,
        "season_name": seasonName,
        "day": day,
        "competition_type": competitionType,
        "sport_name": sportName,
        "venue": venue,
        "status": status,
        "g%": g,
        "m%": m,
        "p%": p,
        "toShowFirst": toShowFirst,
        "fixtures": List<dynamic>.from(fixtures.map((x) => x)),
      };
}
