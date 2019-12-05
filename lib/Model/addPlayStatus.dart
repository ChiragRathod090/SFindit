import 'dart:convert';

AddPlayStatus addPlayStatusFromJson(String str) =>
    AddPlayStatus.fromMap(json.decode(str));

String addPlayStatusToJson(AddPlayStatus data) => json.encode(data.toMap());

class AddPlayStatus {
  int success;
  List<dynamic> result;
  String message;

  AddPlayStatus({
    this.success,
    this.result,
    this.message,
  });

  factory AddPlayStatus.fromMap(Map<String, dynamic> json) => AddPlayStatus(
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
