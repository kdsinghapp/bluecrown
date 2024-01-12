class ScanEventQrModel {
  ScanEventQrResult? result;
  String? message;
  String? status;

  ScanEventQrModel({this.result, this.message, this.status});

  ScanEventQrModel.fromJson(Map<String, dynamic> json) {
    result =
    json['result'] != null ? ScanEventQrResult.fromJson(json['result']) : null;
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (result != null) {
      data['result'] = result!.toJson();
    }
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}

class ScanEventQrResult {
  String? id;
  String? userId;
  String? eventId;
  String? clubId;
  String? points;
  String? message;
  String? dateTime;

  ScanEventQrResult(
      {this.id,
        this.userId,
        this.eventId,
        this.clubId,
        this.points,
        this.message,
        this.dateTime});

  ScanEventQrResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    eventId = json['event_id'];
    clubId = json['club_id'];
    points = json['points'];
    message = json['message'];
    dateTime = json['date_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['event_id'] = eventId;
    data['club_id'] = clubId;
    data['points'] = points;
    data['message'] = message;
    data['date_time'] = dateTime;
    return data;
  }
}
