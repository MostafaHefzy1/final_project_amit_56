class ProductsModel {
  Data? data;

  ProductsModel({this.data});

  ProductsModel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  List<ProductItem>? listProductItem;
  String? nextPageUrl;

  Data({
    this.listProductItem,
    this.nextPageUrl,
  });

  Data.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      listProductItem = <ProductItem>[];
      json['data'].forEach((v) {
        listProductItem!.add(ProductItem.fromJson(v));
      });
    }

    nextPageUrl = json['next_page_url'];
  }
}

class ProductItem {
  int? id;
  int? discount;
  double? price;
  double? oldPrice;
  String? image;
  String? name;
  String? description;
  List<String>? images;
  bool? inFavorites;
  bool? inCart;

  ProductItem(
      {this.id,
      this.discount,
      this.price,
      this.oldPrice,
      this.image,
      this.name,
      this.description,
      this.images,
      this.inFavorites,
      this.inCart});

  ProductItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    discount = json['discount'];
    price = json['price'].toDouble();
    oldPrice = json['old_price'].toDouble();
    image = json['image'];
    name = json['name'];
    description = json['description'];
    images = json['images'].cast<String>();
    inFavorites = json['in_favorites'];
    inCart = json['in_cart'];
  }
}
