class GetNotificationModel {
  List<GetNotificationResult>? result;
  String? message;
  String? status;

  GetNotificationModel({this.result, this.message, this.status});

  GetNotificationModel.fromJson(Map<String, dynamic> json) {
    if (json['status'] != '0') {
      result = <GetNotificationResult>[];
      json['result'].forEach((v) {
        result!.add(GetNotificationResult.fromJson(v));
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

class GetNotificationResult {
  String? id;
  String? userId;
  String? otherUserId;
  String? notification;
  String? status;
  String? dateTime;
  String? userName;
  String? userImage;
  String? otherUserName;
  String? otherUserImage;

  GetNotificationResult(
      {this.id,
        this.userId,
        this.otherUserId,
        this.notification,
        this.status,
        this.dateTime,
        this.userName,
        this.userImage,
        this.otherUserName,
        this.otherUserImage});

  GetNotificationResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    otherUserId = json['other_user_id'];
    notification = json['notification'];
    status = json['status'];
    dateTime = json['date_time'];
    userName = json['user_name'];
    userImage = json['user_image'];
    otherUserName = json['other_user_name'];
    otherUserImage = json['other_user_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['other_user_id'] = otherUserId;
    data['notification'] = notification;
    data['status'] = status;
    data['date_time'] = dateTime;
    data['user_name'] = userName;
    data['user_image'] = userImage;
    data['other_user_name'] = otherUserName;
    data['other_user_image'] = otherUserImage;
    return data;
  }
}
