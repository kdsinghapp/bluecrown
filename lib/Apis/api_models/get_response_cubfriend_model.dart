class GetClubFriendModel {
  List<GetClubFriendResult>? result;
  String? message;
  String? status;

  GetClubFriendModel({this.result, this.message, this.status});

  GetClubFriendModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <GetClubFriendResult>[];
      json['result'].forEach((v) {
        result!.add(GetClubFriendResult.fromJson(v));
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

class GetClubFriendResult {
  String? id;
  String? userId;
  String? friendId;
  String? status;
  String? dateTime;
  String? friendImage;
  String? fullName;
  String? email;
  String? mobile;
  String? address;

  GetClubFriendResult(
      {this.id,
        this.userId,
        this.friendId,
        this.status,
        this.dateTime,
        this.friendImage,
        this.fullName,
        this.email,
        this.mobile,
        this.address});

  GetClubFriendResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    friendId = json['friend_id'];
    status = json['status'];
    dateTime = json['date_time'];
    friendImage = json['friend_image'];
    fullName = json['full_name'];
    email = json['email'];
    mobile = json['mobile'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['friend_id'] = friendId;
    data['status'] = status;
    data['date_time'] = dateTime;
    data['friend_image'] = friendImage;
    data['full_name'] = fullName;
    data['email'] = email;
    data['mobile'] = mobile;
    data['address'] = address;
    return data;
  }
}
