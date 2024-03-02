class UpdateBookingRequestModel {
  UpdateBookingRequestResult? result;
  String? message;
  String? status;

  UpdateBookingRequestModel({this.result, this.message, this.status});

  UpdateBookingRequestModel.fromJson(Map<String, dynamic> json) {
    result = json['result'] != null
        ? UpdateBookingRequestResult.fromJson(json['result'])
        : null;
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

class UpdateBookingRequestResult {
  String? id;
  String? eventId;
  String? clubId;
  String? userId;
  String? fullName;
  String? age;
  String? totalPeople;
  String? status;
  String? dateTime;
  String? type;

  UpdateBookingRequestResult(
      {this.id,
      this.eventId,
      this.clubId,
      this.userId,
      this.fullName,
      this.age,
      this.totalPeople,
      this.status,
      this.dateTime,
      this.type});

  UpdateBookingRequestResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    eventId = json['event_id'];
    clubId = json['club_id'];
    userId = json['user_id'];
    fullName = json['full_name'];
    age = json['age'];
    totalPeople = json['total_people'];
    status = json['status'];
    dateTime = json['date_time'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['event_id'] = eventId;
    data['club_id'] = clubId;
    data['user_id'] = userId;
    data['full_name'] = fullName;
    data['age'] = age;
    data['total_people'] = totalPeople;
    data['status'] = status;
    data['date_time'] = dateTime;
    data['type'] = type;
    return data;
  }
}
