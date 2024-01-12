class AddListModel {
  AddListResult? result;
  String? message;
  String? status;

  AddListModel({this.result, this.message, this.status});

  AddListModel.fromJson(Map<String, dynamic> json) {
    if (json['status'] != '0') {
      result = AddListResult.fromJson(json['result']);
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

class AddListResult {
  String? id;
  String? eventId;
  String? clubId;
  String? userId;
  String? fullName;
  String? age;
  String? totalPeople;
  String? status;
  String? dateTime;

  AddListResult(
      {this.id,
        this.eventId,
        this.clubId,
        this.userId,
        this.fullName,
        this.age,
        this.totalPeople,
        this.status,
        this.dateTime});

  AddListResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    eventId = json['event_id'];
    clubId = json['club_id'];
    userId = json['user_id'];
    fullName = json['full_name'];
    age = json['age'];
    totalPeople = json['total_people'];
    status = json['status'];
    dateTime = json['date_time'];
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
    return data;
  }
}
