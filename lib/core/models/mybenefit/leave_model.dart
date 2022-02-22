class LeaveModel {
  List<Leave> items;
  String status;

  LeaveModel({this.items, this.status});

  factory LeaveModel.fromJson(Map<String, dynamic> json) {
    return LeaveModel(
      items: json['data'] != null
          ? (json['data'] as List).map((i) => Leave.fromJson(i)).toList()
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

class Leave {
  String leaveCode;
  dynamic leaveDay;
  String leaveDesc;
  String updatedAt;

  Leave({
    this.leaveCode,
    this.leaveDay,
    this.leaveDesc,
    this.updatedAt,
  });

  factory Leave.fromJson(Map<String, dynamic> json) {
    return Leave(
      leaveCode: json['leaveCode'],
      leaveDay: json['leaveDay'],
      leaveDesc: json['leaveDesc'],
      updatedAt: json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['leaveCode'] = this.leaveCode;
    data['leaveDay'] = this.leaveDay;
    data['leaveDesc'] = this.leaveDesc;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
