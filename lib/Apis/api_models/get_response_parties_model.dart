class GetPartiesModel {
  List<GetPartiesResult>? result;
  String? message;
  String? status;

  GetPartiesModel({this.result, this.message, this.status});

  GetPartiesModel.fromJson(Map<String, dynamic> json) {
    if (json['status'] == '1') {
      result = <GetPartiesResult>[];
      json['result'].forEach((v) {
        result!.add(GetPartiesResult.fromJson(v));
      });
    }else{
      result = <GetPartiesResult>[];
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

class GetPartiesResult {
  String? id;
  String? categoryId;
  String? name;
  String? locattion;
  String? lat;
  String? lon;
  String? description;
  String? image;
  String? status;
  String? partyDate;
  String? partyTime;
  String? dateTime;
  String? categoryName;

  GetPartiesResult(
      {this.id,
        this.categoryId,
        this.name,
        this.locattion,
        this.lat,
        this.lon,
        this.description,
        this.image,
        this.status,
        this.partyDate,
        this.partyTime,
        this.dateTime,
        this.categoryName});

  GetPartiesResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    name = json['name'];
    locattion = json['locattion'];
    lat = json['lat'];
    lon = json['lon'];
    description = json['description'];
    image = json['image'];
    status = json['status'];
    partyDate = json['party_date'];
    partyTime = json['party_time'];
    dateTime = json['date_time'];
    categoryName = json['category_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['category_id'] = categoryId;
    data['name'] = name;
    data['locattion'] = locattion;
    data['lat'] = lat;
    data['lon'] = lon;
    data['description'] = description;
    data['image'] = image;
    data['status'] = status;
    data['party_date'] = partyDate;
    data['party_time'] = partyTime;
    data['date_time'] = dateTime;
    data['category_name'] = categoryName;
    return data;
  }
}
