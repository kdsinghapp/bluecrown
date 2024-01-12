class CommonResponseModel {
  String? result;
  String? message;
  String? status;

  CommonResponseModel({this.result, this.message, this.status});

  CommonResponseModel.fromJson(Map<String, dynamic> json) {
    result = json['result'];
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['result'] = result;
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}
