// To parse this JSON data, do
//
//     final payInvoice = payInvoiceFromJson(jsonString);

import 'dart:convert';

PayInvoice payInvoiceFromJson(String str) =>
    PayInvoice.fromMap(json.decode(str));

String payInvoiceToJson(PayInvoice data) => json.encode(data.toMap());

class PayInvoice {
  int success;
  List<dynamic> result;
  String message;

  PayInvoice({
    this.success,
    this.result,
    this.message,
  });

  factory PayInvoice.fromMap(Map<String, dynamic> json) => PayInvoice(
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
