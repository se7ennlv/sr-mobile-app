class DrawerMenuModel {
  List<DrawerMenu> drawerMenu;

  DrawerMenuModel({this.drawerMenu});

  factory DrawerMenuModel.fromJson(Map<String, dynamic> json) {
    return DrawerMenuModel(
      drawerMenu: json['menus'] != null
          ? (json['menus'] as List).map((i) => DrawerMenu.fromJson(i)).toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.drawerMenu != null) {
      data['menus'] = this.drawerMenu.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DrawerMenu {
  List<Item> items;
  String leading;
  bool separator;
  String subtitle;
  String title;
  String trailing;

  DrawerMenu(
      {this.items,
      this.leading,
      this.separator,
      this.subtitle,
      this.title,
      this.trailing});

  factory DrawerMenu.fromJson(Map<String, dynamic> json) {
    return DrawerMenu(
      items: json['items'] != null
          ? (json['items'] as List).map((i) => Item.fromJson(i)).toList()
          : null,
      leading: json['leading'],
      separator: json['separator'],
      subtitle: json['subtitle'],
      title: json['title'],
      trailing: json['trailing'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['leading'] = this.leading;
    data['separator'] = this.separator;
    data['subtitle'] = this.subtitle;
    data['title'] = this.title;
    data['trailing'] = this.trailing;
    if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Item {
  String leading;
  String subtitle;
  String title;
  String trailing;

  Item({this.leading, this.subtitle, this.title, this.trailing});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      leading: json['leading'],
      subtitle: json['subtitle'],
      title: json['title'],
      trailing: json['trailing'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['leading'] = this.leading;
    data['subtitle'] = this.subtitle;
    data['title'] = this.title;
    data['trailing'] = this.trailing;
    return data;
  }
}
