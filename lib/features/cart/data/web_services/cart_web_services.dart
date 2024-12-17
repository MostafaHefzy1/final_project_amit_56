import '../../../../core/network/global/dio_helper.dart';
import '../../../../core/network/global/end_point.dart';

class CartWebServices {
 
 
  Future<dynamic> getCartsProducts() async {
    var response = await DioHelper.getData(endPoint: cartsEndPoint);
    return response.data;
  }

  Future<dynamic> addCartsProducts(int productId) async {
    var response = await DioHelper.postData(
        endPoint: cartsEndPoint, data: {"product_id": productId});
    return response.data;
  }

  Future<dynamic> updateCartsProducts(int id, int quantity) async {
    var response = await DioHelper.putData(
        endPoint: "$cartsEndPoint/$id", data: {"quantity": quantity});
    return response.data;
  }


  Future<dynamic> deleteCartsProducts(int id) async {
    var response = await DioHelper.deleteData(
        endPoint: "$cartsEndPoint/$id");
    return response.data;
  }


}
