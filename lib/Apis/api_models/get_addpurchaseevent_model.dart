class AddPurchaseEventModel {
  List<AddPurchaseEventResult>? result;
  String? message;
  String? status;

  AddPurchaseEventModel({this.result, this.message, this.status});

  AddPurchaseEventModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <AddPurchaseEventResult>[];
      json['result'].forEach((v) {
        result!.add(AddPurchaseEventResult.fromJson(v));
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

class AddPurchaseEventResult {
  String? id;
  String? userId;
  String? eventId;
  String? amount;
  String? dateTime;

  AddPurchaseEventResult({this.id, this.userId, this.eventId, this.amount, this.dateTime});

  AddPurchaseEventResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    eventId = json['event_id'];
    amount = json['amount'];
    dateTime = json['date_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['event_id'] = eventId;
    data['amount'] = amount;
    data['date_time'] = dateTime;
    return data;
  }
}
