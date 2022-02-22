class SrpModel {
  List<Srp> items;
  String status;
  dynamic sum;

  SrpModel({
    this.items,
    this.status,
    this.sum,
  });

  factory SrpModel.fromJson(Map<String, dynamic> json) {
    return SrpModel(
      items: json['data'] != null
          ? (json['data'] as List).map((i) => Srp.fromJson(i)).toList()
          : null,
      status: json['status'],
      sum: json['sum'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['sum'] = this.sum;
    if (this.items != null) {
      data['data'] = this.items.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Srp {
  String approvedAt;
  String createdAt;
  String docNo;
  int empId;
  String expiryIn;
  String hodComment;
  dynamic reqScore;
  String requestedAt;
  String updatedAt;

  Srp({
    this.approvedAt,
    this.createdAt,
    this.docNo,
    this.empId,
    this.expiryIn,
    this.hodComment,
    this.reqScore,
    this.requestedAt,
    this.updatedAt,
  });

  factory Srp.fromJson(Map<String, dynamic> json) {
    return Srp(
      approvedAt: json['approvedAt'],
      createdAt: json['createdAt'],
      docNo: json['docNo'],
      empId: json['empId'],
      expiryIn: json['expiryIn'],
      hodComment: json['hodComment'],
      reqScore: json['reqScore'],
      requestedAt: json['requestedAt'],
      updatedAt: json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['approvedAt'] = this.approvedAt;
    data['createdAt'] = this.createdAt;
    data['docNo'] = this.docNo;
    data['empId'] = this.empId;
    data['expiryIn'] = this.expiryIn;
    data['hodComment'] = this.hodComment;
    data['reqScore'] = this.reqScore;
    data['requestedAt'] = this.requestedAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
