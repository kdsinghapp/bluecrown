class GetMyPurchasingEventModel {
  List<GetMyPurchasingEventResult>? result;
  String? message;
  String? status;

  GetMyPurchasingEventModel({this.result, this.message, this.status});

  GetMyPurchasingEventModel.fromJson(Map<String, dynamic> json) {
    if (json['status'] != '0') {
      result = <GetMyPurchasingEventResult>[];
      json['result'].forEach((v) {
        result!.add(GetMyPurchasingEventResult.fromJson(v));
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

class GetMyPurchasingEventResult {
  String? id;
  String? userId;
  String? eventId;
  String? amount;
  String? dateTime;
  String? clubId;
  String? eventName;
  String? image;

  GetMyPurchasingEventResult(
      {this.id,
        this.userId,
        this.eventId,
        this.amount,
        this.dateTime,
        this.clubId,
        this.eventName,
        this.image});

  GetMyPurchasingEventResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    eventId = json['event_id'];
    amount = json['amount'];
    dateTime = json['date_time'];
    clubId = json['club_id'];
    eventName = json['event_name'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['event_id'] = eventId;
    data['amount'] = amount;
    data['date_time'] = dateTime;
    data['club_id'] = clubId;
    data['event_name'] = eventName;
    data['image'] = image;
    return data;
  }
}

