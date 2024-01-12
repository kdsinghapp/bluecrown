class FriendsRequestModel {
  FriendsRequestResult? result;
  String? message;
  String? status;

  FriendsRequestModel({this.result, this.message, this.status});

  FriendsRequestModel.fromJson(Map<String, dynamic> json) {
    result =
    json['result'] != null ? FriendsRequestResult.fromJson(json['result']) : null;
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

class FriendsRequestResult {
  String? id;
  String? userId;
  String? eventId;
  String? friendId;
  String? status;
  String? dateTime;

  FriendsRequestResult(
      {this.id,
        this.userId,
        this.eventId,
        this.friendId,
        this.status,
        this.dateTime});

  FriendsRequestResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    eventId = json['event_id'];
    friendId = json['friend_id'];
    status = json['status'];
    dateTime = json['date_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['event_id'] = eventId;
    data['friend_id'] = friendId;
    data['status'] = status;
    data['date_time'] = dateTime;
    return data;
  }
}
