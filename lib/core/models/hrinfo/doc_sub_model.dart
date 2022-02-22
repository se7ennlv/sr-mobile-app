class SubDocModel {
  List<SubDoc> items;
  String status;

  SubDocModel({this.items, this.status});

  factory SubDocModel.fromJson(Map<String, dynamic> json) {
    return SubDocModel(
      items: json['data'] != null
          ? (json['data'] as List).map((i) => SubDoc.fromJson(i)).toList()
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

class SubDoc {
  String leading;
  String title;
  String subtitle;
  String trailing;
  List<ItemDoc> item;

  SubDoc({
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
    this.item,
  });

  factory SubDoc.fromJson(Map<String, dynamic> json) {
    return SubDoc(
      item: json['items'] != null
          ? (json['items'] as List).map((i) => ItemDoc.fromJson(i)).toList()
          : null,
      leading: json['leading'],
      title: json['title'],
      subtitle: json['subtitle'],
      trailing: json['trailing'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['leading'] = this.leading;
    data['title'] = this.title;
    data['subtitle'] = this.subtitle;
    data['trailing'] = this.trailing;
    if (this.item != null) {
      data['items'] = this.item.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ItemDoc {
  String title;
  String subtitle;
  String fileSrc;

  ItemDoc({
    this.title,
    this.subtitle,
    this.fileSrc,
  });

  factory ItemDoc.fromJson(Map<String, dynamic> json) {
    return ItemDoc(
      title: json['title'],
      subtitle: json['subtitle'],
      fileSrc: json['fileSrc'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['subtitle'] = this.subtitle;
    data['fileSrc'] = this.fileSrc;
    return data;
  }
}
