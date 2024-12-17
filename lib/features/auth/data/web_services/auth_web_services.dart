import '../../../../core/network/global/dio_helper.dart';
import '../../../../core/network/global/end_point.dart';
import '../models/login_request_model.dart';
import '../models/register_request_model.dart';

class AuthWebServices {
  
  
  Future<dynamic> login(LoginRequestModel loginRequestModel) async {
    var response = await DioHelper.postData(
        endPoint: loginEndPoint, data: loginRequestModel.toJson());
    return response.data;
  }

  Future<dynamic> register(RegisterRequestModel registerRequestModel) async {
    var response = await DioHelper.postData(
        endPoint: registerEndPoint, data: registerRequestModel.toJson());
    return response.data;
  }


}
