class CheckOtpModel {
  CheckOtpResult? result;
  String? message;
  String? status;

  CheckOtpModel({this.result, this.message, this.status});

  CheckOtpModel.fromJson(Map<String, dynamic> json) {
    result =
    json['status'] == '1' ? CheckOtpResult.fromJson(json['result']) : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result!.toJson();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class CheckOtpResult {
  String? id;
  String? fullName;
  String? dob;
  String? email;
  String? password;
  String? image;
  String? registerId;
  String? socialId;
  String? type;
  String? status;
  String? token;
  String? expiredAt;
  String? lastLogin;
  String? dateTime;
  String? mobile;
  String? iosRegisterId;
  String? lat;
  String? lon;
  String? address;
  String? gender;
  String? otp;

  CheckOtpResult(
      {this.id,
        this.fullName,
        this.dob,
        this.email,
        this.password,
        this.image,
        this.registerId,
        this.socialId,
        this.type,
        this.status,
        this.token,
        this.expiredAt,
        this.lastLogin,
        this.dateTime,
        this.mobile,
        this.iosRegisterId,
        this.lat,
        this.lon,
        this.address,
        this.gender,
        this.otp});

  CheckOtpResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    dob = json['dob'];
    email = json['email'];
    password = json['password'];
    image = json['image'];
    registerId = json['register_id'];
    socialId = json['social_id'];
    type = json['type'];
    status = json['status'];
    token = json['token'];
    expiredAt = json['expired_at'];
    lastLogin = json['last_login'];
    dateTime = json['date_time'];
    mobile = json['mobile'];
    iosRegisterId = json['ios_register_id'];
    lat = json['lat'];
    lon = json['lon'];
    address = json['address'];
    gender = json['gender'];
    otp = json['otp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['full_name'] = fullName;
    data['dob'] = dob;
    data['email'] = email;
    data['password'] = password;
    data['image'] = image;
    data['register_id'] = registerId;
    data['social_id'] = socialId;
    data['type'] = type;
    data['status'] = status;
    data['token'] = token;
    data['expired_at'] = expiredAt;
    data['last_login'] = lastLogin;
    data['date_time'] = dateTime;
    data['mobile'] = mobile;
    data['ios_register_id'] = iosRegisterId;
    data['lat'] = lat;
    data['lon'] = lon;
    data['address'] = address;
    data['gender'] = gender;
    data['otp'] = otp;
    return data;
  }
}
