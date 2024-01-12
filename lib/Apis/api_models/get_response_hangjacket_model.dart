class HangJacketModel {
  HangJacketResult? result;
  String? message;
  String? status;

  HangJacketModel({this.result, this.message, this.status});

  HangJacketModel.fromJson(Map<String, dynamic> json) {
    result =
    json['result'] != null ? HangJacketResult.fromJson(json['result']) : null;
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

class HangJacketResult {
  String? id;
  String? userId;
  String? clubId;
  String? qrcode;
  String? checkIn;
  String? checkOut;
  String? checkout;
  String? dateTime;

  HangJacketResult(
      {this.id,
        this.userId,
        this.clubId,
        this.qrcode,
        this.checkIn,
        this.checkOut,
        this.checkout,
        this.dateTime});

  HangJacketResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    clubId = json['club_id'];
    qrcode = json['qrcode'];
    checkIn = json['check_in'];
    checkOut = json['check_out'];
    checkout = json['checkout'];
    dateTime = json['date_time'];
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
    return data;
  }
}
