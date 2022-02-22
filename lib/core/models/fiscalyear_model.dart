class FiscalYearModel {
  List<FiscalYear> fiscalYear;
  String status;

  FiscalYearModel({this.fiscalYear, this.status});

  factory FiscalYearModel.fromJson(Map<String, dynamic> json) {
    return FiscalYearModel(
      fiscalYear: json['data'] != null
          ? (json['data'] as List).map((i) => FiscalYear.fromJson(i)).toList()
          : null,
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.fiscalYear != null) {
      data['data'] = this.fiscalYear.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class FiscalYear {
  dynamic yearCode;
  String desc;

  FiscalYear({this.desc, this.yearCode});

  factory FiscalYear.fromJson(Map<String, dynamic> json) {
    return FiscalYear(
      yearCode: json['yearCode'],
      desc: json['desc'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['yearCode'] = this.yearCode;
    data['desc'] = this.desc;
    return data;
  }
}
