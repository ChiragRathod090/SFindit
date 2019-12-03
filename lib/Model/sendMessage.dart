// To parse this JSON data, do
//
//     final sendMessage = sendMessageFromJson(jsonString);

import 'dart:convert';

SendMessage sendMessageFromJson(String str) =>
    SendMessage.fromMap(json.decode(str));

String sendMessageToJson(SendMessage data) => json.encode(data.toMap());

class SendMessage {
  int success;
  String message;
  List<dynamic> result;

  SendMessage({
    this.success,
    this.message,
    this.result,
  });

  factory SendMessage.fromMap(Map<String, dynamic> json) => SendMessage(
        success: json["success"],
        message: json["message"],
        result: List<dynamic>.from(json["result"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "success": success,
        "message": message,
        "result": List<dynamic>.from(result.map((x) => x)),
      };
}
