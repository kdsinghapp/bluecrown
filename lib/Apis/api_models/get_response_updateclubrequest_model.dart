class UpdateClubRequestModel {
  Result? result;
  String? message;
  String? status;

  UpdateClubRequestModel({this.result, this.message, this.status});

  UpdateClubRequestModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = Result.fromJson(json['result']);
    } else {
      result = null;
    }
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

class Result {
  String? id;
  String? fullName;
  String? dob;
  String? email;
  String? password;
  String? image;
  String? registerId;
  String? socialId;
  String? type;
  String? userCategory;
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
  String? otp;
  String? request;

  Result(
      {this.id,
        this.fullName,
        this.dob,
        this.email,
        this.password,
        this.image,
        this.registerId,
        this.socialId,
        this.type,
        this.userCategory,
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
        this.otp,
        this.request});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    dob = json['dob'];
    email = json['email'];
    password = json['password'];
    image = json['image'];
    registerId = json['register_id'];
    socialId = json['social_id'];
    type = json['type'];
    userCategory = json['user_category'];
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
    otp = json['otp'];
    request = json['request'];
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
    data['user_category'] = userCategory;
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
    data['otp'] = otp;
    data['request'] = request;
    return data;
  }
}
