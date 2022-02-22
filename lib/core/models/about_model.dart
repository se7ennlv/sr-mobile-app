class AboutModel {
  About about;
  String status;

  AboutModel({this.about, this.status});

  factory AboutModel.fromJson(Map<String, dynamic> json) {
    return AboutModel(
      about: json['data'] != null ? About.fromJson(json['data']) : null,
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.about != null) {
      data['data'] = this.about.toJson();
    }
    return data;
  }
}

class About {
  String srDesc;
  String srImage;
  String srVdoSrc;
  String thsDesc;
  String thsImage;

  About({
    this.srDesc,
    this.srImage,
    this.srVdoSrc,
    this.thsDesc,
    this.thsImage,
  });

  factory About.fromJson(Map<String, dynamic> json) {
    return About(
      srDesc: json['srDesc'],
      srImage: json['srImage'],
      srVdoSrc: json['srVdoSrc'],
      thsDesc: json['thsDesc'],
      thsImage: json['thsImage'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['srDesc'] = this.srDesc;
    data['srImage'] = this.srImage;
    data['srVdoSrc'] = this.srVdoSrc;
    data['thsDesc'] = this.thsDesc;
    data['thsImage'] = this.thsImage;
    return data;
  }
}
