class TermsConditionModel {
  List<TermsConditionResult>? result;
  String? message;
  String? status;

  TermsConditionModel({this.result, this.message, this.status});

  TermsConditionModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <TermsConditionResult>[];
      json['result'].forEach((v) {
        result!.add(TermsConditionResult.fromJson(v));
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

class TermsConditionResult {
  String? id;
  String? name;
  String? description;
  String? dateTime;

  TermsConditionResult({this.id, this.name, this.description, this.dateTime});

  TermsConditionResult.fromJson(Map<String, dynamic> json) {
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
