import 'package:final_project_amit56/core/network/global/dio_helper.dart';
import 'package:final_project_amit56/core/network/global/end_point.dart';

class HomeWebServices {
  Future<dynamic> getBanners() async {
    var response = await DioHelper.getData(endPoint: bannersEndPoint);
    return response.data;
  }

  Future<dynamic> getCategories() async {
    var response = await DioHelper.getData(endPoint: categoriesEndPoint);
    return response.data;
  }

  Future<dynamic> getProducts({int? categoryId}) async {
    var response = await DioHelper.getData(
        endPoint: productsEndPoint,
        queryParameters: {"category_id": categoryId});
    return response.data;
  }

  Future<dynamic> getDetailsProduct(int productID) async {
    var response =
        await DioHelper.getData(endPoint: "$productsEndPoint/$productID");
    return response.data;
  }
}
