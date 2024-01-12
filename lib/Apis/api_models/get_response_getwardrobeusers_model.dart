class GetWardrobeUsersModel {
  List<GetWardrobeUsersResult>? result;
  String? message;
  String? status;

  GetWardrobeUsersModel({this.result, this.message, this.status});

  GetWardrobeUsersModel.fromJson(Map<String, dynamic> json) {
    if (json['status'] != '0') {
      result = <GetWardrobeUsersResult>[];
      json['result'].forEach((v) {
        result!.add(GetWardrobeUsersResult.fromJson(v));
      });
    }else{
      result=[];
    }
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class GetWardrobeUsersResult {
  String? id;
  String? userId;
  String? clubId;
  String? qrcode;
  String? checkIn;
  String? checkOut;
  String? checkout;
  String? dateTime;
  String? userName;
  String? userEmail;
  String? userMobile;
  String? userImage;

  GetWardrobeUsersResult(
      {this.id,
        this.userId,
        this.clubId,
        this.qrcode,
        this.checkIn,
        this.checkOut,
        this.checkout,
        this.dateTime,
        this.userName,
        this.userEmail,
        this.userMobile,
        this.userImage});

  GetWardrobeUsersResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    clubId = json['club_id'];
    qrcode = json['qrcode'];
    checkIn = json['check_in'];
    checkOut = json['check_out'];
    checkout = json['checkout'];
    dateTime = json['date_time'];
    userName = json['user_name'];
    userEmail = json['user_email'];
    userMobile = json['user_mobile'];
    userImage = json['user_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['club_id'] = clubId;
    data['qrcode'] = qrcode;
    data['check_in'] = checkIn;
    data['check_out'] = checkOut;
    data['checkout'] = checkout;
    data['date_time'] = dateTime;
    data['user_name'] = userName;
    data['user_email'] = userEmail;
    data['user_mobile'] = userMobile;
    data['user_image'] = userImage;
    return data;
  }
}
