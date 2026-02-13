class AllGameListModel {
  bool? status;
  String? message;
  List<Data>? data;

  AllGameListModel({this.status, this.message, this.data});

  AllGameListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  dynamic id;
  dynamic name;
  dynamic catId;
  dynamic gmId;
  dynamic img;
  dynamic status;
  dynamic datetime;

  Data(
      {this.id,
        this.name,
        this.catId,
        this.gmId,
        this.img,
        this.status,
        this.datetime});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    catId = json['cat_id'];
    gmId = json['gmId'];
    img = json['img'];
    status = json['status'];
    datetime = json['datetime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['cat_id'] = this.catId;
    data['gmId'] = this.gmId;
    data['img'] = this.img;
    data['status'] = this.status;
    data['datetime'] = this.datetime;
    return data;
  }
}
