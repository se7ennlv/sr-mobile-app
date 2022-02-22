class MyMartModel {
  List<MyMart> items;
  dynamic balance;
  String status;
  dynamic sum;

  MyMartModel({this.items, this.balance, this.status, this.sum});

  factory MyMartModel.fromJson(Map<String, dynamic> json) {
    return MyMartModel(
      items: json['data'] != null
          ? (json['data'] as List).map((i) => MyMart.fromJson(i)).toList()
          : null,
      balance: json['balance'],
      status: json['status'],
      sum: json['sum'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['balance'] = this.balance;
    data['status'] = this.status;
    data['sum'] = this.sum;
    if (this.items != null) {
      data['data'] = this.items.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class MyMart {
  String docNo;
  int empId;
  dynamic totalCredit;
  String tranDate;
  String updatedAt;

  MyMart(
      {this.docNo,
      this.empId,
      this.totalCredit,
      this.tranDate,
      this.updatedAt});

  factory MyMart.fromJson(Map<String, dynamic> json) {
    return MyMart(
      docNo: json['docNo'],
      empId: json['empId'],
      totalCredit: json['totalCredit'],
      tranDate: json['tranDate'],
      updatedAt: json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['docNo'] = this.docNo;
    data['empId'] = this.empId;
    data['totalCredit'] = this.totalCredit;
    data['tranDate'] = this.tranDate;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
