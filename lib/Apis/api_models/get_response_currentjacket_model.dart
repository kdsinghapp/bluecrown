class GetCurrentJacketModel {
  List<GetCurrentJacketResult>? result;
  String? message;
  String? status;

  GetCurrentJacketModel({this.result, this.message, this.status});

  GetCurrentJacketModel.fromJson(Map<String, dynamic> json) {
    if (json['status'] != '0') {
      result = <GetCurrentJacketResult>[];
      json['result'].forEach((v) {
        result!.add(GetCurrentJacketResult.fromJson(v));
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

class GetCurrentJacketResult {
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
  String? clubName;
  String? clubEmail;
  String? clubMobile;
  String? clubImage;
  String? hangerQrcode;
  String? hangerBooked;

  GetCurrentJacketResult(
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
        this.userImage,
        this.clubName,
        this.clubEmail,
        this.clubMobile,
        this.clubImage,
        this.hangerQrcode,
        this.hangerBooked});

  GetCurrentJacketResult.fromJson(Map<String, dynamic> json) {
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
    clubName = json['club_name'];
    clubEmail = json['club_email'];
    clubMobile = json['club_mobile'];
    clubImage = json['club_image'];
    hangerQrcode = json['hanger_qrcode'];
    hangerBooked = json['hanger_booked'];
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
    data['club_name'] = clubName;
    data['club_email'] = clubEmail;
    data['club_mobile'] = clubMobile;
    data['club_image'] = clubImage;
    data['hanger_qrcode'] = hangerQrcode;
    data['hanger_booked'] = hangerBooked;
    return data;
  }
}
