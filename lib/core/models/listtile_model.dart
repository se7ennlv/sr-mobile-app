class ListTileModel {
  List<ListTileItem> items;

  ListTileModel({this.items});

  factory ListTileModel.fromJson(Map<String, dynamic> json) {
    return ListTileModel(
      items: json['data'] != null
          ? (json['data'] as List).map((i) => ListTileItem.fromJson(i)).toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.items != null) {
      data['data'] = this.items.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ListTileItem {
  String leading;
  String title;
  String subtitle;
  String trailing;

  ListTileItem({
    this.leading,
    this.title,
    this.subtitle,
    this.trailing,
  });

  factory ListTileItem.fromJson(Map<String, dynamic> json) {
    return ListTileItem(
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
    return data;
  }
}
