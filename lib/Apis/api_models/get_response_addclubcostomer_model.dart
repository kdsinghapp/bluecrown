class AddCostomerModel {
  Result? result;
  String? message;
  String? status;

  AddCostomerModel({this.result, this.message, this.status});

  AddCostomerModel.fromJson(Map<String, dynamic> json) {
    result =
    json['result'] != null ? Result.fromJson(json['result']) : null;
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

class Result {
  String? id;
  String? userId;
  String? friendId;
  String? status;
  String? dateTime;

  Result({this.id, this.userId, this.friendId, this.status, this.dateTime});

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    friendId = json['friend_id'];
    status = json['status'];
    dateTime = json['date_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['friend_id'] = friendId;
    data['status'] = status;
    data['date_time'] = dateTime;
    return data;
  }
}
