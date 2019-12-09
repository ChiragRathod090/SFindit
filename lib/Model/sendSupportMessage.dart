// To parse this JSON data, do
//
//     final sendSupportMessage = sendSupportMessageFromJson(jsonString);

import 'dart:convert';

SendSupportMessage sendSupportMessageFromJson(String str) =>
    SendSupportMessage.fromMap(json.decode(str));

String sendSupportMessageToJson(SendSupportMessage data) =>
    json.encode(data.toMap());

class SendSupportMessage {
  int success;
  List<dynamic> result;
  String message;

  SendSupportMessage({
    this.success,
    this.result,
    this.message,
  });

  factory SendSupportMessage.fromMap(Map<String, dynamic> json) =>
      SendSupportMessage(
        success: json["success"],
        result: List<dynamic>.from(json["result"].map((x) => x)),
        message: json["message"],
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "result": List<dynamic>.from(result.map((x) => x)),
        "message": message,
      };
}
