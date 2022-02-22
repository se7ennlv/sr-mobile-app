class MySurveyModel {
  List<MySurvey> items;
  String status;

  MySurveyModel({this.items, this.status});

  factory MySurveyModel.fromJson(Map<String, dynamic> json) {
    return MySurveyModel(
      items: json['data'] != null
          ? (json['data'] as List).map((i) => MySurvey.fromJson(i)).toList()
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

class MySurvey {
  Child child;
  String createdAt;
  String dept;
  int empId;
  String empName;
  String id;
  int onYear;
  bool isSubmitted;
  String surveyId;
  String updatedAt;

  MySurvey({
    this.child,
    this.createdAt,
    this.dept,
    this.empId,
    this.empName,
    this.id,
    this.onYear,
    this.isSubmitted,
    this.surveyId,
    this.updatedAt,
  });

  factory MySurvey.fromJson(Map<String, dynamic> json) {
    return MySurvey(
      child: json['child'] != null ? Child.fromJson(json['child']) : null,
      createdAt: json['createdAt'],
      dept: json['dept'],
      empId: json['empId'],
      empName: json['empName'],
      id: json['id'],
      onYear: json['onYear'],
      isSubmitted: json['isSubmitted'],
      surveyId: json['surveyId'],
      updatedAt: json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['createdAt'] = this.createdAt;
    data['dept'] = this.dept;
    data['empId'] = this.empId;
    data['empName'] = this.empName;
    data['id'] = this.id;
    data['onYear'] = this.onYear;
    data['isSubmitted'] = this.isSubmitted;
    data['surveyId'] = this.surveyId;
    data['updatedAt'] = this.updatedAt;
    if (this.child != null) {
      data['child'] = this.child.toJson();
    }
    return data;
  }
}

class Child {
  String id;
  String topic;
  String url;

  Child({this.id, this.topic, this.url});

  factory Child.fromJson(Map<String, dynamic> json) {
    return Child(
      id: json['id'],
      topic: json['topic'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['topic'] = this.topic;
    data['url'] = this.url;
    return data;
  }
}
