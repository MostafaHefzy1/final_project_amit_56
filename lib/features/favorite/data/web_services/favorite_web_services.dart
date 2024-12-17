import '../../../../core/network/global/dio_helper.dart';
import '../../../../core/network/global/end_point.dart';

class FavoriteWebServices {
  Future<dynamic> favoritesProduct() async {
    var response = await DioHelper.getData(endPoint: favoritesEndPoint);
    return response.data;
  }

  Future<dynamic> addOrDeleteFavoriteProduct(int productID) async {
    var response = await DioHelper.postData(
        endPoint: favoritesEndPoint, data: {"product_id": productID});
    return response.data;
  }
}
