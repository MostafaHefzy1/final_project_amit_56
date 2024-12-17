import '../models/add_cart_model.dart';
import '../models/carts_model.dart';
import '../models/update_or_delete_model.dart';

import '../web_services/cart_web_services.dart';

class CartRepository {
  final CartWebServices _cartWebServices;

  CartRepository(this._cartWebServices);

  Future<GetCartsModel> getCartsProducts() async {
    return GetCartsModel.fromJson(await _cartWebServices.getCartsProducts());
  }

  Future<AddCartModel> addCartsProducts(int productId) async {
    return AddCartModel.fromJson(
        await _cartWebServices.addCartsProducts(productId));
  }

  Future<UpdateOrDeleteCartModel> updateCartsProducts(
      int id, int quantity) async {
    return UpdateOrDeleteCartModel.fromJson(
        await _cartWebServices.updateCartsProducts(id, quantity));
  }

  Future<UpdateOrDeleteCartModel> deleteCartsProducts(int id) async {
    return UpdateOrDeleteCartModel.fromJson(
        await _cartWebServices.deleteCartsProducts(id));
  }
}
