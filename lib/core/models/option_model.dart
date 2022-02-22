class OptionModel {
  OptionItem item;
  String status;

  OptionModel({this.item, this.status});

  factory OptionModel.fromJson(Map<String, dynamic> json) {
    return OptionModel(
      item: json['data'] != null ? OptionItem.fromJson(json['data']) : null,
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.item != null) {
      data['data'] = this.item.toJson();
    }
    return data;
  }
}

class OptionItem {
  String optionName;
  dynamic optionValue;

  OptionItem({this.optionName, this.optionValue});

  factory OptionItem.fromJson(Map<String, dynamic> json) {
    return OptionItem(
      optionName: json['optionName'],
      optionValue: json['optionValue'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['optionName'] = this.optionName;
    data['optionValue'] = this.optionValue;
    return data;
  }
}
