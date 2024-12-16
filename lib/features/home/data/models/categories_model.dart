class CategoriesModel {
  bool? status;
  Data? data;

  CategoriesModel({this.status,this.data});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  List<CategoriesItem>? data;

  String? nextPageUrl;

  Data({
    this.data,
    this.nextPageUrl,
  });

  Data.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <CategoriesItem>[];
      json['data'].forEach((v) {
        data!.add(CategoriesItem.fromJson(v));
      });
    }

    nextPageUrl = json['next_page_url'];
  }
}

class CategoriesItem {
  int? id;
  String? name;
  String? image;

  CategoriesItem({this.id, this.name, this.image});

  CategoriesItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
  }
}
