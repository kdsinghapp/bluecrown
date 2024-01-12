class CategoryModel {
  List<CategoryResult>? result;
  String? message;
  String? status;

  CategoryModel({this.result, this.message, this.status});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <CategoryResult>[];
      json['result'].forEach((v) {
        result!.add(CategoryResult.fromJson(v));
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

class CategoryResult {
  String? id;
  String? name;
  String? image;
  String? description;
  String? status;
  String? dateTime;

  CategoryResult(
      {this.id,
        this.name,
        this.image,
        this.description,
        this.status,
        this.dateTime});

  CategoryResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    description = json['description'];
    status = json['status'];
    dateTime = json['date_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['description'] = description;
    data['status'] = status;
    data['date_time'] = dateTime;
    return data;
  }
}
