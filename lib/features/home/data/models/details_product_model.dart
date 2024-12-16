import 'package:final_project_amit56/features/home/data/models/products_model.dart';

class DetailsProductsModel {
  bool? status;
  ProductItem? data;

  DetailsProductsModel({this.status, this.data});

  DetailsProductsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? ProductItem.fromJson(json['data']) : null;
  }
}
