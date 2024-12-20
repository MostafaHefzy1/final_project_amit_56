
import '../models/profile_model.dart';
import '../web_services/profile_web_services.dart';
import 'package:image_picker/image_picker.dart';

class ProfileRepository {
  final ProfileWebServices _profileWebServices;

  ProfileRepository(this._profileWebServices);

  Future<ProfileModel> getProfile() async {
    return ProfileModel.fromJson(await _profileWebServices.getProfile());
  }

  Future<ProfileModel> updateProfile(
      {required String name,
      required String phone,
      required String email,
      XFile? file}) async {
    return ProfileModel.fromJson(await _profileWebServices.updateProfile(
        name: name, phone: phone, email: email, file: file));
  }

  Future<dynamic> changePassword({
    required String currentPassword,
    required String newPassword,
  }) async {
    return await _profileWebServices.changePassword(
        currentPassword: currentPassword, newPassword: newPassword);
  }
}
