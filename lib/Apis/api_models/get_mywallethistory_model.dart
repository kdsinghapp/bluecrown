class MyWalletHistoryModel {
  List<MyWalletHistoryResult>? result;
  String? message;
  String? status;

  MyWalletHistoryModel({this.result, this.message, this.status});

  MyWalletHistoryModel.fromJson(Map<String, dynamic> json) {
    if (json['status'] != '0') {
      result = <MyWalletHistoryResult>[];
      json['result'].forEach((v) {
        result!.add(MyWalletHistoryResult.fromJson(v));
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

class MyWalletHistoryResult {
  String? id;
  String? userId;
  String? eventId;
  String? clubId;
  String? points;
  String? message;
  String? dateTime;

  MyWalletHistoryResult(
      {this.id,
        this.userId,
        this.eventId,
        this.clubId,
        this.points,
        this.message,
        this.dateTime});

  MyWalletHistoryResult.fromJson(Map<String, dynamic> json) {
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
