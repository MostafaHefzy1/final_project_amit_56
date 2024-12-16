import 'package:final_project_amit56/core/network/local/shared_preference.dart';

import '../../app_import/app_import.dart';

class DioHelper {
  static Dio? dio;

  static initDioHelper() {
    dio = Dio(BaseOptions(
        baseUrl: "https://student.valuxapps.com/api/",
        receiveDataWhenStatusError: true,
        headers: {
          "Authorization": '${CacheHelper.getData(key: "token")}',
        }));

    dio!.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
    ));
  }

  static Future<Response> getData(
      {required String endPoint, Map<String, dynamic>? queryParameters}) async {
    return await dio!.get(endPoint, queryParameters: queryParameters);
  }

  static Future<Response> postData(
      {required String endPoint, required dynamic data}) async {
    return await dio!.post(endPoint, data: data);
  }
}
