import 'package:final_project_amit56/features/auth/data/models/auth_response_model.dart';
import 'package:final_project_amit56/features/auth/data/models/login_request_model.dart';
import 'package:final_project_amit56/features/auth/data/models/register_request_model.dart';
import 'package:final_project_amit56/features/auth/data/web_services/auth_web_services.dart';

class AuthRepository {
  final AuthWebServices _authWebServices;

  AuthRepository(this._authWebServices);

  Future<AuthModel> login(LoginRequestModel loginRequestModel) async {
    return AuthModel.fromJson(await _authWebServices.login(loginRequestModel));
  }

  Future<AuthModel> register(RegisterRequestModel registerRequestModel) async {
    return AuthModel.fromJson(
        await _authWebServices.register(registerRequestModel));
  }
}
