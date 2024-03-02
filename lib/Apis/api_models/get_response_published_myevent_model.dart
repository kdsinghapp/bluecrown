class PublishMyEventModel {
  List<PublishMyEventResult>? result;
  String? message;
  String? status;

  PublishMyEventModel({this.result, this.message, this.status});

  PublishMyEventModel.fromJson(Map<String, dynamic> json) {
    if (json['status'] != '0') {
      result = <PublishMyEventResult>[];
      json['result'].forEach((v) {
        result!.add(PublishMyEventResult.fromJson(v));
      });
    } else {
      result = [];
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

class PublishMyEventResult {
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
  String? entranceCost;
  String? qrCode;
  String? status;
  String? dateTime;

  PublishMyEventResult(
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
      this.entranceCost,
      this.qrCode,
      this.status,
      this.dateTime});

  PublishMyEventResult.fromJson(Map<String, dynamic> json) {
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
    entranceCost = json['entrance_cost'];
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
    data['entrance_cost'] = entranceCost;
    data['qr_code'] = qrCode;
    data['status'] = status;
    data['date_time'] = dateTime;
    return data;
  }
}
