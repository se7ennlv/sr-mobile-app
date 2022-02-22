class MainDocModel {
  String status;
  List<MainDoc> items;

  MainDocModel({this.status, this.items});

  MainDocModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      items = [];
      json['data'].forEach((v) {
        items.add(new MainDoc.fromJson(v));
      });
    }
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

class MainDoc {
  String wLeading;
  String mLeading;
  bool isDefault;
  bool isActive;
  String sId;
  String title;
  String subtitle;
  String trailing;
  int orderIndex;
  String createdAt;
  String updatedAt;

  MainDoc(
      {this.wLeading,
      this.mLeading,
      this.isDefault,
      this.isActive,
      this.sId,
      this.title,
      this.subtitle,
      this.trailing,
      this.orderIndex,
      this.createdAt,
      this.updatedAt});

  MainDoc.fromJson(Map<String, dynamic> json) {
    wLeading = json['wLeading'];
    mLeading = json['mLeading'];
    isDefault = json['isDefault'];
    isActive = json['isActive'];
    sId = json['_id'];
    title = json['title'];
    subtitle = json['subtitle'];
    trailing = json['trailing'];
    orderIndex = json['orderIndex'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['wLeading'] = this.wLeading;
    data['mLeading'] = this.mLeading;
    data['isDefault'] = this.isDefault;
    data['isActive'] = this.isActive;
    data['_id'] = this.sId;
    data['title'] = this.title;
    data['subtitle'] = this.subtitle;
    data['trailing'] = this.trailing;
    data['orderIndex'] = this.orderIndex;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
