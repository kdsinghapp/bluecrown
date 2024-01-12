class AddEventModel {
  AddEventResult? result;
  String? message;
  String? status;

  AddEventModel({this.result, this.message, this.status});

  AddEventModel.fromJson(Map<String, dynamic> json) {
    result =
    json['result'] != null ? AddEventResult.fromJson(json['result']) : null;
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

class AddEventResult {
  String? id;
  String? userId;
  String? name;
  String? style;
  String? description;
  String? image;
  String? fromDate;
  String? toDate;
  String? fromTime;
  String? minAge;
  String? maxAge;
  String? points;
  String? qrCode;
  String? status;
  String? dateTime;

  AddEventResult(
      {this.id,
        this.userId,
        this.name,
        this.style,
        this.description,
        this.image,
        this.fromDate,
        this.toDate,
        this.fromTime,
        this.minAge,
        this.maxAge,
        this.points,
        this.qrCode,
        this.status,
        this.dateTime});

  AddEventResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    name = json['name'];
    style = json['style'];
    description = json['description'];
    image = json['image'];
    fromDate = json['from_date'];
    toDate = json['to_date'];
    fromTime = json['from_time'];
    minAge = json['min_age'];
    maxAge = json['max_age'];
    points = json['points'];
    qrCode = json['qr_code'];
    status = json['status'];
    dateTime = json['date_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['name'] = name;
    data['style'] = style;
    data['description'] = description;
    data['image'] = image;
    data['from_date'] = fromDate;
    data['to_date'] = toDate;
    data['from_time'] = fromTime;
    data['min_age'] = minAge;
    data['max_age'] = maxAge;
    data['points'] = points;
    data['qr_code'] = qrCode;
    data['status'] = status;
    data['date_time'] = dateTime;
    return data;
  }
}
