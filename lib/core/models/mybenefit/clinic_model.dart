class ClinicModel {
  List<Clinic> items;
  String status;

  ClinicModel({this.items, this.status});

  factory ClinicModel.fromJson(Map<String, dynamic> json) {
    return ClinicModel(
      items: json['data'] != null
          ? (json['data'] as List).map((i) => Clinic.fromJson(i)).toList()
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

class Clinic {
  List<Child> child;
  String diagnosisNote;
  String docNo;
  int empId;
  bool isSickLeave;
  int onYear;
  dynamic updatedAt;
  dynamic visitedAt;

  Clinic({
    this.child,
    this.diagnosisNote,
    this.docNo,
    this.empId,
    this.isSickLeave,
    this.onYear,
    this.updatedAt,
    this.visitedAt,
  });

  factory Clinic.fromJson(Map<String, dynamic> json) {
    return Clinic(
      child: json['child'] != null
          ? (json['child'] as List).map((i) => Child.fromJson(i)).toList()
          : null,
      diagnosisNote: json['diagnosisNote'],
      docNo: json['docNo'],
      empId: json['empId'],
      isSickLeave: json['isSickLeave'],
      onYear: json['onYear'],
      updatedAt: json['updatedAt'],
      visitedAt: json['visitedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['diagnosisNote'] = this.diagnosisNote;
    data['docNo'] = this.docNo;
    data['empId'] = this.empId;
    data['isSickLeave'] = this.isSickLeave;
    data['onYear'] = this.onYear;
    data['updatedAt'] = this.updatedAt;
    data['visitedAt'] = this.visitedAt;
    if (this.child != null) {
      data['child'] = this.child.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Child {
  String docNo;
  String medCode;
  String medName;
  int qtyUsed;
  dynamic updatedAt;

  Child({
    this.docNo,
    this.medCode,
    this.medName,
    this.qtyUsed,
    this.updatedAt,
  });

  factory Child.fromJson(Map<String, dynamic> json) {
    return Child(
      docNo: json['docNo'],
      medCode: json['medCode'],
      medName: json['medName'],
      qtyUsed: json['qtyUsed'],
      updatedAt: json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['docNo'] = this.docNo;
    data['medCode'] = this.medCode;
    data['medName'] = this.medName;
    data['qtyUsed'] = this.qtyUsed;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
