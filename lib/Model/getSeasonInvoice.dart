// To parse this JSON data, do
//
//     final getSeasonInvoice = getSeasonInvoiceFromJson(jsonString);

import 'dart:convert';

GetSeasonInvoice getSeasonInvoiceFromJson(String str) =>
    GetSeasonInvoice.fromMap(json.decode(str));

String getSeasonInvoiceToJson(GetSeasonInvoice data) =>
    json.encode(data.toMap());

class GetSeasonInvoice {
  int success;
  Result result;
  String message;

  GetSeasonInvoice({
    this.success,
    this.result,
    this.message,
  });

  factory GetSeasonInvoice.fromMap(Map<String, dynamic> json) =>
      GetSeasonInvoice(
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
  List<CardList> cardList;
  List<TotalDatum> totalData;

  Result({
    this.cardList,
    this.totalData,
  });

  factory Result.fromMap(Map<String, dynamic> json) => Result(
        cardList: List<CardList>.from(
            json["card_list"].map((x) => CardList.fromMap(x))),
        totalData: List<TotalDatum>.from(
            json["total_data"].map((x) => TotalDatum.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "card_list": List<dynamic>.from(cardList.map((x) => x.toMap())),
        "total_data": List<dynamic>.from(totalData.map((x) => x.toMap())),
      };
}

class CardList {
  String teamId;
  String seasonId;
  String cost;
  String remaining;
  String paid;
  String weeks;
  String due;
  String teamName;
  String competitionId;
  String venueName;
  String sport;
  String day;
  String compType;

  CardList({
    this.teamId,
    this.seasonId,
    this.cost,
    this.remaining,
    this.paid,
    this.weeks,
    this.due,
    this.teamName,
    this.competitionId,
    this.venueName,
    this.sport,
    this.day,
    this.compType,
  });

  factory CardList.fromMap(Map<String, dynamic> json) => CardList(
        teamId: json["teamID"],
        seasonId: json["seasonID"],
        cost: json["cost"],
        remaining: json["remaining"],
        paid: json["paid"],
        weeks: json["weeks"],
        due: json["due"],
        teamName: json["team_name"],
        competitionId: json["competition_id"],
        venueName: json["venue_name"],
        sport: json["sport"],
        day: json["day"],
        compType: json["comp_type"],
      );

  Map<String, dynamic> toMap() => {
        "teamID": teamId,
        "seasonID": seasonId,
        "cost": cost,
        "remaining": remaining,
        "paid": paid,
        "weeks": weeks,
        "due": due,
        "team_name": teamName,
        "competition_id": competitionId,
        "venue_name": venueName,
        "sport": sport,
        "day": day,
        "comp_type": compType,
      };
}

class TotalDatum {
  String total;
  String paid;
  String owning;

  TotalDatum({
    this.total,
    this.paid,
    this.owning,
  });

  factory TotalDatum.fromMap(Map<String, dynamic> json) => TotalDatum(
        total: json["total"],
        paid: json["paid"],
        owning: json["owning"],
      );

  Map<String, dynamic> toMap() => {
        "total": total,
        "paid": paid,
        "owning": owning,
      };
}
