class getSeasonList {
  String message;
  List<Result> result;
  int success;

  getSeasonList({this.message, this.result, this.success});

  factory getSeasonList.fromJson(Map<String, dynamic> json) {
    return getSeasonList(
      message: json['message'],
      result: json['result'] != null
          ? (json['result'] as List).map((i) => Result.fromJson(i)).toList()
          : null,
      success: json['success'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['success'] = this.success;
    if (this.result != null) {
      data['result'] = this.result.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Result {
  String current;
  String id;
  String name;
  String seasonal;
  String sfindit;
  String sfindit_inchat;

  Result(
      {this.current,
      this.id,
      this.name,
      this.seasonal,
      this.sfindit,
      this.sfindit_inchat});

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      current: json['current'],
      id: json['id'],
      name: json['name'],
      seasonal: json['seasonal'],
      sfindit: json['sfindit'],
      sfindit_inchat: json['sfindit_inchat'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current'] = this.current;
    data['id'] = this.id;
    data['name'] = this.name;
    data['seasonal'] = this.seasonal;
    data['sfindit'] = this.sfindit;
    data['sfindit_inchat'] = this.sfindit_inchat;
    return data;
  }
}
