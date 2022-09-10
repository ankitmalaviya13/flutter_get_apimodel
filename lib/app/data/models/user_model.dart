class User {
  Data? data;
  String? link;

  User({this.data, this.link});

  User.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data?.fromJson(json['data']) : null;
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (data != null) {
      data['data'] = data?.toJson();
    }
    data['link'] = link;
    return data;
  }
}

class Data {
  int? uid;
  String? profile;
  String? email;
  String? phone;
  String? firstName;
  String? lastName;
  String? regTs;
  String? regIp;
  int? confirmed;
  dynamic consentTs;
  String? lang;
  String? password;
  String? lastTs;
  dynamic confirmHash;
  dynamic confirmHashTS;

  Data(
      {this.uid,
      this.profile,
      this.email,
      this.phone,
      this.firstName,
      this.lastName,
      this.regTs,
      this.regIp,
      this.confirmed,
      this.consentTs,
      this.lang,
      this.password,
      this.lastTs,
      this.confirmHash,
      this.confirmHashTS});

  Data.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    profile = json['profile'];
    email = json['email'];
    phone = json['phone'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    regTs = json['reg_ts'];
    regIp = json['reg_ip'];
    confirmed = json['confirmed'];
    consentTs = json['consent_ts'];
    lang = json['lang'];
    password = json['password'];
    lastTs = json['last_ts'];
    confirmHash = json['confirmHash'];
    confirmHashTS = json['confirmHashTS'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['uid'] = uid;
    data['profile'] = profile;
    data['email'] = email;
    data['phone'] = phone;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['reg_ts'] = regTs;
    data['reg_ip'] = regIp;
    data['confirmed'] = confirmed;
    data['consent_ts'] = consentTs;
    data['lang'] = lang;
    data['password'] = password;
    data['last_ts'] = lastTs;
    data['confirmHash'] = confirmHash;
    data['confirmHashTS'] = confirmHashTS;
    return data;
  }
}
