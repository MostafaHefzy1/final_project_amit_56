import 'package:final_project_amit56/core/network/global/dio_helper.dart';
import 'package:final_project_amit56/core/network/global/end_point.dart';
import 'package:final_project_amit56/features/auth/data/models/login_request_model.dart';
import 'package:final_project_amit56/features/auth/data/models/register_request_model.dart';

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
