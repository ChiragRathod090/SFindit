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
  DayWiseData dayWiseData;
  int toShowRound;
  List<String> rounds;

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
        fixtureData:
            List<Datum>.from(json["fixtureData"].map((x) => Datum.fromMap(x))),
        dayWiseData: DayWiseData.fromMap(json["dayWiseData"]),
        toShowRound: json["toShowRound"],
        rounds: List<String>.from(json["rounds"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "ladderData": List<dynamic>.from(ladderData.map((x) => x.toMap())),
        "fixtureData": List<dynamic>.from(fixtureData.map((x) => x.toMap())),
        "dayWiseData": dayWiseData.toMap(),
        "toShowRound": toShowRound,
        "rounds": List<dynamic>.from(rounds.map((x) => x)),
      };
}

class DayWiseData {
  List<Round> round1;
  List<Round> round2;
  List<Round> round3;

  DayWiseData({
    this.round1,
    this.round2,
    this.round3,
  });

  factory DayWiseData.fromMap(Map<String, dynamic> json) => DayWiseData(
        round1: List<Round>.from(json["Round1"].map((x) => Round.fromMap(x))),
        round2: List<Round>.from(json["Round2"].map((x) => Round.fromMap(x))),
        round3: List<Round>.from(json["Round3"].map((x) => Round.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "Round1": List<dynamic>.from(round1.map((x) => x.toMap())),
        "Round2": List<dynamic>.from(round2.map((x) => x.toMap())),
        "Round3": List<dynamic>.from(round3.map((x) => x.toMap())),
      };
}

class Round {
  MatchDate matchDate;
  String matchId;
  String home;
  String away;
  String played;
  String hscore;
  String ascore;
  String overwrite;
  String court;
  int completed;
  int cancelled;
  Round1LofMessage lofMessage;
  String sportsId;
  MatchTime matchTime;
  String homeTeamName;
  String awayTeamName;
  String noMatch;

  Round({
    this.matchDate,
    this.matchId,
    this.home,
    this.away,
    this.played,
    this.hscore,
    this.ascore,
    this.overwrite,
    this.court,
    this.completed,
    this.cancelled,
    this.lofMessage,
    this.sportsId,
    this.matchTime,
    this.homeTeamName,
    this.awayTeamName,
    this.noMatch,
  });

  factory Round.fromMap(Map<String, dynamic> json) => Round(
        matchDate: json["match_date"] == null
            ? null
            : matchDateValues.map[json["match_date"]],
        matchId: json["match_id"] == null ? null : json["match_id"],
        home: json["home"] == null ? null : json["home"],
        away: json["away"] == null ? null : json["away"],
        played: json["played"] == null ? null : json["played"],
        hscore: json["hscore"] == null ? null : json["hscore"],
        ascore: json["ascore"] == null ? null : json["ascore"],
        overwrite: json["overwrite"] == null ? null : json["overwrite"],
        court: json["court"] == null ? null : json["court"],
        completed: json["completed"] == null ? null : json["completed"],
        cancelled: json["cancelled"] == null ? null : json["cancelled"],
        lofMessage: json["lof_message"] == null
            ? null
            : round1LofMessageValues.map[json["lof_message"]],
        sportsId: json["sports_id"] == null ? null : json["sports_id"],
        matchTime: json["match_time"] == null
            ? null
            : matchTimeValues.map[json["match_time"]],
        homeTeamName:
            json["home_team_name"] == null ? null : json["home_team_name"],
        awayTeamName:
            json["away_team_name"] == null ? null : json["away_team_name"],
        noMatch: json["no_match"] == null ? null : json["no_match"],
      );

  Map<String, dynamic> toMap() => {
        "match_date":
            matchDate == null ? null : matchDateValues.reverse[matchDate],
        "match_id": matchId == null ? null : matchId,
        "home": home == null ? null : home,
        "away": away == null ? null : away,
        "played": played == null ? null : played,
        "hscore": hscore == null ? null : hscore,
        "ascore": ascore == null ? null : ascore,
        "overwrite": overwrite == null ? null : overwrite,
        "court": court == null ? null : court,
        "completed": completed == null ? null : completed,
        "cancelled": cancelled == null ? null : cancelled,
        "lof_message": lofMessage == null
            ? null
            : round1LofMessageValues.reverse[lofMessage],
        "sports_id": sportsId == null ? null : sportsId,
        "match_time":
            matchTime == null ? null : matchTimeValues.reverse[matchTime],
        "home_team_name": homeTeamName == null ? null : homeTeamName,
        "away_team_name": awayTeamName == null ? null : awayTeamName,
        "no_match": noMatch == null ? null : noMatch,
      };
}

enum Round1LofMessage { EMPTY, AWAY_TEAM_FORFEITED, HOME_TEAM_FORFEITED }

final round1LofMessageValues = EnumValues({
  "Away team forfeited": Round1LofMessage.AWAY_TEAM_FORFEITED,
  "": Round1LofMessage.EMPTY,
  "Home team forfeited": Round1LofMessage.HOME_TEAM_FORFEITED
});

enum MatchDate { NOV_19, NOV_26, DEC_03 }

final matchDateValues = EnumValues({
  "Dec 03": MatchDate.DEC_03,
  "Nov 19": MatchDate.NOV_19,
  "Nov 26": MatchDate.NOV_26
});

enum MatchTime {
  THE_820_PM,
  THE_635_PM,
  THE_935_PM,
  THE_1010_PM,
  THE_745_PM,
  THE_600_PM,
  THE_710_PM,
  THE_900_PM,
  THE_1200_AM
}

final matchTimeValues = EnumValues({
  "10:10 PM": MatchTime.THE_1010_PM,
  "12:00 AM": MatchTime.THE_1200_AM,
  "6:00 PM": MatchTime.THE_600_PM,
  "6:35 PM": MatchTime.THE_635_PM,
  "7:10 PM": MatchTime.THE_710_PM,
  "7:45 PM": MatchTime.THE_745_PM,
  "8:20 PM": MatchTime.THE_820_PM,
  "9:00 PM": MatchTime.THE_900_PM,
  "9:35 PM": MatchTime.THE_935_PM
});

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
  DivisionName divisionName;
  SeasonName seasonName;
  String day;
  CompetitionType competitionType;
  SportName sportName;
  Venue venue;
  String status;
  String g;
  String m;
  String p;
  int toShowFirst;
  List<Fixture> fixtures;

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
        divisionName: divisionNameValues.map[json["division_name"]],
        seasonName: seasonNameValues.map[json["season_name"]],
        day: json["day"],
        competitionType: competitionTypeValues.map[json["competition_type"]],
        sportName: sportNameValues.map[json["sport_name"]],
        venue: venueValues.map[json["venue"]],
        status: json["status"],
        g: json["g%"],
        m: json["m%"],
        p: json["p%"],
        toShowFirst: json["toShowFirst"],
        fixtures:
            List<Fixture>.from(json["fixtures"].map((x) => Fixture.fromMap(x))),
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
        "division_name": divisionNameValues.reverse[divisionName],
        "season_name": seasonNameValues.reverse[seasonName],
        "day": day,
        "competition_type": competitionTypeValues.reverse[competitionType],
        "sport_name": sportNameValues.reverse[sportName],
        "venue": venueValues.reverse[venue],
        "status": status,
        "g%": g,
        "m%": m,
        "p%": p,
        "toShowFirst": toShowFirst,
        "fixtures": List<dynamic>.from(fixtures.map((x) => x.toMap())),
      };
}

enum CompetitionType { MIXED }

final competitionTypeValues = EnumValues({"Mixed": CompetitionType.MIXED});

enum DivisionName { PRELIMINARY_ROUNDS }

final divisionNameValues =
    EnumValues({"Preliminary Rounds": DivisionName.PRELIMINARY_ROUNDS});

class Fixture {
  String matchId;
  Venue venue;
  String home;
  String away;
  String played;
  String hscore;
  String ascore;
  String overwrite;
  String number;
  MatchDate matchDate;
  DivisionName divisionName;
  SeasonName seasonName;
  VenueName venueName;
  int completed;
  int cancelled;
  FixtureLofMessage lofMessage;
  int requestFlag;
  String opponentName;
  int homeTeam;
  RoundNumber roundNumber;
  MatchTime matchTime;
  NoMatch noMatch;

  Fixture({
    this.matchId,
    this.venue,
    this.home,
    this.away,
    this.played,
    this.hscore,
    this.ascore,
    this.overwrite,
    this.number,
    this.matchDate,
    this.divisionName,
    this.seasonName,
    this.venueName,
    this.completed,
    this.cancelled,
    this.lofMessage,
    this.requestFlag,
    this.opponentName,
    this.homeTeam,
    this.roundNumber,
    this.matchTime,
    this.noMatch,
  });

  factory Fixture.fromMap(Map<String, dynamic> json) => Fixture(
        matchId: json["match_id"],
        venue: venueValues.map[json["venue"]],
        home: json["home"],
        away: json["away"],
        played: json["played"],
        hscore: json["hscore"],
        ascore: json["ascore"],
        overwrite: json["overwrite"],
        number: json["number"],
        matchDate: matchDateValues.map[json["match_date"]],
        divisionName: divisionNameValues.map[json["division_name"]],
        seasonName: seasonNameValues.map[json["season_name"]],
        venueName: venueNameValues.map[json["venue_name"]],
        completed: json["completed"],
        cancelled: json["cancelled"],
        lofMessage: fixtureLofMessageValues.map[json["lof_message"]],
        requestFlag: json["request_flag"],
        opponentName:
            json["opponent_name"] == null ? null : json["opponent_name"],
        homeTeam: json["home_team"],
        roundNumber: roundNumberValues.map[json["round_number"]],
        matchTime: matchTimeValues.map[json["match_time"]],
        noMatch: json["no_match"] == null
            ? null
            : noMatchValues.map[json["no_match"]],
      );

  Map<String, dynamic> toMap() => {
        "match_id": matchId,
        "venue": venueValues.reverse[venue],
        "home": home,
        "away": away,
        "played": played,
        "hscore": hscore,
        "ascore": ascore,
        "overwrite": overwrite,
        "number": number,
        "match_date": matchDateValues.reverse[matchDate],
        "division_name": divisionNameValues.reverse[divisionName],
        "season_name": seasonNameValues.reverse[seasonName],
        "venue_name": venueNameValues.reverse[venueName],
        "completed": completed,
        "cancelled": cancelled,
        "lof_message": fixtureLofMessageValues.reverse[lofMessage],
        "request_flag": requestFlag,
        "opponent_name": opponentName == null ? null : opponentName,
        "home_team": homeTeam,
        "round_number": roundNumberValues.reverse[roundNumber],
        "match_time": matchTimeValues.reverse[matchTime],
        "no_match": noMatch == null ? null : noMatchValues.reverse[noMatch],
      };
}

enum FixtureLofMessage { EMPTY, OPPONENT_FORFEITED, LOST_ON_FORFEIT }

final fixtureLofMessageValues = EnumValues({
  "": FixtureLofMessage.EMPTY,
  "Lost on Forfeit": FixtureLofMessage.LOST_ON_FORFEIT,
  "Opponent Forfeited": FixtureLofMessage.OPPONENT_FORFEITED
});

enum NoMatch { BYE_NO_GAME_SCHEDULED }

final noMatchValues =
    EnumValues({"BYE: No game scheduled": NoMatch.BYE_NO_GAME_SCHEDULED});

enum RoundNumber { R1, R2, R3 }

final roundNumberValues = EnumValues(
    {"R1": RoundNumber.R1, "R2": RoundNumber.R2, "R3": RoundNumber.R3});

enum SeasonName { SUMMER_20192020 }

final seasonNameValues =
    EnumValues({"Summer 2019/2020": SeasonName.SUMMER_20192020});

enum Venue { CH }

final venueValues = EnumValues({"CH": Venue.CH});

enum VenueName { CLIFTON_HILL }

final venueNameValues = EnumValues({"Clifton Hill": VenueName.CLIFTON_HILL});

enum SportName { FULL_COURT_NETBALL }

final sportNameValues =
    EnumValues({"Full Court Netball": SportName.FULL_COURT_NETBALL});

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
