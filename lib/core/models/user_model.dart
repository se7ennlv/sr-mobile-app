class UserModel {
  int deptId;
  String deptName;
  String email;
  int empId;
  String fileSrc;
  String fname;
  String fullName;
  String gender;
  String hiringDate;
  String id;
  String jobTitle;
  String lname;
  dynamic mymartBalance;
  String passwordUpdatedAt;
  Role role;
  dynamic srpScore;
  String tel;

  UserModel({
    this.deptId,
    this.deptName,
    this.email,
    this.empId,
    this.fileSrc,
    this.fname,
    this.fullName,
    this.gender,
    this.hiringDate,
    this.id,
    this.jobTitle,
    this.lname,
    this.mymartBalance,
    this.passwordUpdatedAt,
    this.role,
    this.srpScore,
    this.tel,
  });

  UserModel.initial()
      : deptId = 0,
        deptName = '',
        email = '',
        empId = 0,
        fileSrc = '',
        fname = '',
        fullName = '',
        gender = '',
        hiringDate = '',
        id = '',
        jobTitle = '',
        lname = '',
        mymartBalance = 0,
        passwordUpdatedAt = '',
        role = null,
        srpScore = 0,
        tel = '';

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      deptId: json['deptId'],
      deptName: json['deptName'],
      email: json['email'],
      empId: json['empId'],
      fileSrc: json['fileSrc'],
      fname: json['fname'],
      fullName: json['fullName'],
      gender: json['gender'],
      hiringDate: json['hiringDate'],
      id: json['id'],
      jobTitle: json['jobTitle'],
      lname: json['lname'],
      mymartBalance: json['mymartBalance'],
      passwordUpdatedAt: json['passwordUpdatedAt'],
      role: json['role'] != null ? Role.fromJson(json['role']) : null,
      srpScore: json['srpScore'],
      tel: json['tel'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['deptId'] = this.deptId;
    data['deptName'] = this.deptName;
    data['email'] = this.email;
    data['empId'] = this.empId;
    data['fileSrc'] = this.fileSrc;
    data['fname'] = this.fname;
    data['fullName'] = this.fullName;
    data['gender'] = this.gender;
    data['hiringDate'] = this.hiringDate;
    data['id'] = this.id;
    data['jobTitle'] = this.jobTitle;
    data['lname'] = this.lname;
    data['mymartBalance'] = this.mymartBalance;
    data['passwordUpdatedAt'] = this.passwordUpdatedAt;
    data['srpScore'] = this.srpScore;
    data['tel'] = this.tel;
    if (this.role != null) {
      data['role'] = this.role.toJson();
    }
    return data;
  }
}

class Role {
  int id;
  String name;

  Role({this.id, this.name});

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
