class GetClubHangerModel {
  List<GetClubHangerResult>? result;
  String? message;
  String? status;

  GetClubHangerModel({this.result, this.message, this.status});

  GetClubHangerModel.fromJson(Map<String, dynamic> json) {
    if (json['status'] != '0') {
      result = <GetClubHangerResult>[];
      json['result'].forEach((v) {
        result!.add(GetClubHangerResult.fromJson(v));
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

class GetClubHangerResult {
  String? id;
  String? clubId;
  String? qrcode;
  String? status;
  String? booked;
  String? dateTime;

  GetClubHangerResult(
      {this.id,
        this.clubId,
        this.qrcode,
        this.status,
        this.booked,
        this.dateTime});

  GetClubHangerResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    clubId = json['club_id'];
    qrcode = json['qrcode'];
    status = json['status'];
    booked = json['booked'];
    dateTime = json['date_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['club_id'] = clubId;
    data['qrcode'] = qrcode;
    data['status'] = status;
    data['booked'] = booked;
    data['date_time'] = dateTime;
    return data;
  }
}

