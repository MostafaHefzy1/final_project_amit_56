import 'package:final_project_amit56/features/favorite/data/model/add_or_delete_product_model.dart';
import 'package:final_project_amit56/features/favorite/data/model/favorite_product_model.dart';
import 'package:final_project_amit56/features/favorite/data/web_services/favorite_web_services.dart';

class FavoriteRepository {
  final FavoriteWebServices _favoriteWebServices;

  FavoriteRepository(this._favoriteWebServices);

  Future<FavoriteProductsModel> favoritesProduct() async {
    return FavoriteProductsModel.fromJson(
        await _favoriteWebServices.favoritesProduct());
  }

  Future<AddOrDeleteFavoriteProductsModel> addOrDeleteFavoriteProduct(
      int productID) async {
    return AddOrDeleteFavoriteProductsModel.fromJson(
        await _favoriteWebServices.addOrDeleteFavoriteProduct(productID));
  }
}
