
import 'package:dio/dio.dart';
import '../../../../core/network/global/dio_helper.dart';
import '../../../../core/network/global/end_point.dart';
import 'package:image_picker/image_picker.dart';

class ProfileWebServices {
  Future<dynamic> getProfile() async {
    var response = await DioHelper.getData(endPoint: profileEndPoint);
    return response.data;
  }

  Future<dynamic> updateProfile(
      {required String name,
      required String phone,
      required String email,
      XFile? file}) async {
    FormData data = FormData.fromMap({
      if (file != null)
        "image": await MultipartFile.fromFile(file.path,
            filename: file.path.split("/").last),
      "name": name,
      "phone": phone,
      "email": email,
      "_method": "PUT"
    });
    var response =
        await DioHelper.postData(endPoint: updateProfileEndPoint, data: data);
    return response.data;
  }

  Future<dynamic> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    FormData data = FormData.fromMap(
        {"current_password": currentPassword, "new_password": newPassword});
    var response =
        await DioHelper.postData(endPoint: changePasswordEndPoint, data: data);
    return response.data;
  }
}
