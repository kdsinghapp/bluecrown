class HowToEarnPointsModel {
  List<HowToEarnPointsResult>? result;
  String? message;
  String? status;

  HowToEarnPointsModel({this.result, this.message, this.status});

  HowToEarnPointsModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <HowToEarnPointsResult>[];
      json['result'].forEach((v) {
        result!.add(HowToEarnPointsResult.fromJson(v));
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

class HowToEarnPointsResult {
  String? id;
  String? name;
  String? description;
  String? dateTime;

  HowToEarnPointsResult({this.id, this.name, this.description, this.dateTime});

  HowToEarnPointsResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    dateTime = json['date_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['date_time'] = dateTime;
    return data;
  }
}
