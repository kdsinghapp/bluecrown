class GetBookingRequestModel {
  List<GetBookingRequest>? result;
  String? message;
  String? status;

  GetBookingRequestModel({this.result, this.message, this.status});

  GetBookingRequestModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <GetBookingRequest>[];
      json['result'].forEach((v) {
        result!.add(GetBookingRequest.fromJson(v));
      });
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

class GetBookingRequest {
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
  String? eventName;
  String? description;
  String? eventStyle;
  String? eventDate;
  String? eventTime;
  String? eventImage;

  GetBookingRequest(
      {this.id,
        this.eventId,
        this.clubId,
        this.userId,
        this.fullName,
        this.age,
        this.totalPeople,
        this.status,
        this.dateTime,
        this.type,
        this.eventName,
        this.description,
        this.eventStyle,
        this.eventDate,
        this.eventTime,
        this.eventImage});

  GetBookingRequest.fromJson(Map<String, dynamic> json) {
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
    eventName = json['event_name'];
    description = json['description'];
    eventStyle = json['event_style'];
    eventDate = json['event_date'];
    eventTime = json['event_time'];
    eventImage = json['event_image'];
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
    data['event_name'] = eventName;
    data['description'] = description;
    data['event_style'] = eventStyle;
    data['event_date'] = eventDate;
    data['event_time'] = eventTime;
    data['event_image'] = eventImage;
    return data;
  }
}

