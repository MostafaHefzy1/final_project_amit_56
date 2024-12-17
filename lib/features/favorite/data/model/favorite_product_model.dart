class FavoriteProductsModel {
  bool? status;
  Data? data;

  FavoriteProductsModel({this.status, this.data});

  FavoriteProductsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  List<FavoriteItem>? data;

  String? nextPageUrl;

  Data({
    this.data,
    this.nextPageUrl,
  });

  Data.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <FavoriteItem>[];
      json['data'].forEach((v) {
        data!.add(FavoriteItem.fromJson(v));
      });
    }

    nextPageUrl = json['next_page_url'];
  }
}

class FavoriteItem {
  int? id;
  Product? product;

  FavoriteItem({this.id, this.product});

  FavoriteItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product =
        json['product'] != null ? Product.fromJson(json['product']) : null;
  }
}

class Product {
  int? id;
  int? price;
  int? oldPrice;
  int? discount;
  String? image;
  String? name;
  String? description;

  Product(
      {this.id,
      this.price,
      this.oldPrice,
      this.discount,
      this.image,
      this.name,
      this.description});

  Product.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
  }
}
