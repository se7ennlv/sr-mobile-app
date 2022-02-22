class PromotionModel {
  List<Promotion> promotion;
  String status;

  PromotionModel({this.promotion, this.status});

  factory PromotionModel.fromJson(Map<String, dynamic> json) {
    return PromotionModel(
      promotion: json['data'] != null
          ? (json['data'] as List).map((i) => Promotion.fromJson(i)).toList()
          : null,
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.promotion != null) {
      data['data'] = this.promotion.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Promotion {
  String sid;
  String createdAt;
  String desc;
  String expiryDate;
  String fileSrc;
  bool isActive;
  String publishedDate;
  String title;
  String updatedAt;

  Promotion(
      {this.sid,
      this.createdAt,
      this.desc,
      this.expiryDate,
      this.fileSrc,
      this.isActive,
      this.publishedDate,
      this.title,
      this.updatedAt});

  factory Promotion.fromJson(Map<String, dynamic> json) {
    return Promotion(
      sid: json['_id'],
      createdAt: json['createdAt'],
      desc: json['desc'],
      expiryDate: json['expiryDate'],
      fileSrc: json['fileSrc'],
      isActive: json['isActive'],
      publishedDate: json['publishedDate'],
      title: json['title'],
      updatedAt: json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sid;
    data['createdAt'] = this.createdAt;
    data['desc'] = this.desc;
    data['expiryDate'] = this.expiryDate;
    data['fileSrc'] = this.fileSrc;
    data['isActive'] = this.isActive;
    data['publishedDate'] = this.publishedDate;
    data['title'] = this.title;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
