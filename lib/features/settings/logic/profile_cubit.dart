
import 'package:bloc/bloc.dart';
import '../data/models/profile_model.dart';
import '../data/repository/profile_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepository _profileRepository;
  ProfileCubit(this._profileRepository) : super(ProfileInitial());

  static ProfileCubit get(context) => BlocProvider.of(context);

  XFile? imageFile;
  final ImagePicker picker = ImagePicker();
  Future<void> getImageUser() async {
    XFile? selectedImages = await picker.pickImage(source: ImageSource.gallery);
    if (selectedImages != null) {
      imageFile = selectedImages;
      emit(ImagePickedSuccessState());
    } else {
      emit(ImagePickedFailedState());
    }
  }

  ProfileModel? profileModel;
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  void getProfile() async {
    await _profileRepository.getProfile().then((value) {
      profileModel = value;
      fillDataProfile();
      emit(GetProfileSuccessState());
    }).catchError((error) {
      emit(GetProfileFailedState());
    });
  }

  void fillDataProfile() {
    emailController.text = profileModel?.data?.email ?? "";
    phoneController.text = profileModel?.data?.phone ?? "";
    nameController.text = profileModel?.data?.name ?? "";
    emit(FillDataProfileSucceeState());
  }

  updateProfileScreen() async {
    emit(UpdateProfileLoadingState());
    await _profileRepository
        .updateProfile(
            name: nameController.text,
            phone: phoneController.text,
            email: emailController.text,
            file: imageFile)
        .then((value) {
      emit(UpdateProfileSuccessState());
    }).catchError((error) {
      emit(UpdateProfileFailedState());
    });
  }

  TextEditingController currentPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  void changePassword() async {
    emit(ChangePasswordLoadingState());
    await _profileRepository
        .changePassword(
            currentPassword: currentPasswordController.text,
            newPassword: newPasswordController.text)
        .then((value) {
      emit(ChangePasswordSuccessState());
    }).catchError((error) {
      emit(ChangePasswordFailedState());
    });
  }

}
