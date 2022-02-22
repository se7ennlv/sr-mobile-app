class MonthModel {
  List<Month> items;
  String status;

  MonthModel({this.items, this.status});

  factory MonthModel.fromJson(Map<String, dynamic> json) {
    return MonthModel(
      items: json['data'] != null
          ? (json['data'] as List).map((i) => Month.fromJson(i)).toList()
          : null,
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.items != null) {
      data['data'] = this.items.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Month {
  String desc;
  dynamic monthCode;
  String monthName;

  Month({this.desc, this.monthCode, this.monthName});

  factory Month.fromJson(Map<String, dynamic> json) {
    return Month(
      desc: json['desc'],
      monthCode: json['monthCode'],
      monthName: json['monthName'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['desc'] = this.desc;
    data['monthCode'] = this.monthCode;
    data['monthName'] = this.monthName;
    return data;
  }
}
