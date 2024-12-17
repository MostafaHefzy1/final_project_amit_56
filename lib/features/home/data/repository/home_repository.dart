import '../models/banners_model.dart';
import '../models/categories_model.dart';
import '../models/details_product_model.dart';
import '../models/products_model.dart';
import '../web_services/home_web_services.dart';

class HomeRepository {
  final HomeWebServices _homeWebServices;

  HomeRepository(this._homeWebServices);

  Future<BannersModel> getBanners() async {
    return BannersModel.fromJson(await _homeWebServices.getBanners());
  }

  Future<CategoriesModel> getCategories() async {
    return CategoriesModel.fromJson(await _homeWebServices.getCategories());
  }

  Future<ProductsModel> getProducts({int? categoryId}) async {
    return ProductsModel.fromJson(
        await _homeWebServices.getProducts(categoryId: categoryId));
  }

  Future<DetailsProductsModel> getDetailsProduct(int productID) async {
    return DetailsProductsModel.fromJson(
        await _homeWebServices.getDetailsProduct(productID));
  }
}
