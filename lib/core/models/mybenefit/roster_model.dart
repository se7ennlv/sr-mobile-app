class RosterModel {
  List<Roster> items;
  String status;

  RosterModel({this.items, this.status});

  factory RosterModel.fromJson(Map<String, dynamic> json) {
    return RosterModel(
      items: json['data'] != null
          ? (json['data'] as List).map((i) => Roster.fromJson(i)).toList()
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

class Roster {
  String earlyCheckOut;
  int empId;
  String firstCheckIn;
  String lastCheckOut;
  String lateCheckIn;
  String shiftCode;
  String shiftEnd;
  String shiftStart;
  String updatedAt;
  String workday;

  Roster({
    this.earlyCheckOut,
    this.empId,
    this.firstCheckIn,
    this.lastCheckOut,
    this.lateCheckIn,
    this.shiftCode,
    this.shiftEnd,
    this.shiftStart,
    this.updatedAt,
    this.workday,
  });

  factory Roster.fromJson(Map<String, dynamic> json) {
    return Roster(
      earlyCheckOut: json['earlyCheckOut'],
      empId: json['empId'],
      firstCheckIn: json['firstCheckIn'],
      lastCheckOut: json['lastCheckOut'],
      lateCheckIn: json['lateCheckIn'],
      shiftCode: json['shiftCode'],
      shiftEnd: json['shiftEnd'],
      shiftStart: json['shiftStart'],
      updatedAt: json['updatedAt'],
      workday: json['workday'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['earlyCheckOut'] = this.earlyCheckOut;
    data['empId'] = this.empId;
    data['firstCheckIn'] = this.firstCheckIn;
    data['lastCheckOut'] = this.lastCheckOut;
    data['lateCheckIn'] = this.lateCheckIn;
    data['shiftCode'] = this.shiftCode;
    data['shiftEnd'] = this.shiftEnd;
    data['shiftStart'] = this.shiftStart;
    data['updatedAt'] = this.updatedAt;
    data['workday'] = this.workday;
    return data;
  }
}
