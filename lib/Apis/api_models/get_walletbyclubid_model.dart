class GetClubWalletModel {
  GetClubWalletResult? result;
  String? message;
  String? status;

  GetClubWalletModel({this.result, this.message, this.status});

  GetClubWalletModel.fromJson(Map<String, dynamic> json) {
    result =
    json['status'] !='0' ? GetClubWalletResult.fromJson(json['result']) : null;
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

class GetClubWalletResult {
  String? id;
  String? userId;
  String? clubId;
  String? wallet;
  String? dateTime;

  GetClubWalletResult({this.id, this.userId, this.clubId, this.wallet, this.dateTime});

  GetClubWalletResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    clubId = json['club_id'];
    wallet = json['wallet'];
    dateTime = json['date_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['club_id'] = clubId;
    data['wallet'] = wallet;
    data['date_time'] = dateTime;
    return data;
  }
}
