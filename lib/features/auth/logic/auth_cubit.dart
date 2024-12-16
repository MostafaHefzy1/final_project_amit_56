import 'package:final_project_amit56/core/network/global/dio_helper.dart';
import 'package:final_project_amit56/core/network/local/shared_preference.dart';
import 'package:final_project_amit56/core/routing/routes.dart';
import 'package:final_project_amit56/features/auth/data/models/login_request_model.dart';
import 'package:final_project_amit56/features/auth/data/models/register_request_model.dart';
import 'package:final_project_amit56/features/auth/data/repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;
  AuthCubit(this._authRepository) : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);

  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPasswordController = TextEditingController();
  var formKeyLogin = GlobalKey<FormState>();
  void login(context) {
    emit(LoginLoadingState());
    _authRepository
        .login(LoginRequestModel(
            email: loginEmailController.text,
            password: loginPasswordController.text))
        .then((value) {
      CacheHelper.saveData(key: "token", value: value.data!.token);
      DioHelper.initDioHelper();
      Navigator.pushReplacementNamed(context, Routes.bottomNavBarScreen);
      emit(LoginSuccessState());
    }).catchError((error) {
      emit(LoginFailedState());
    });
  }

  TextEditingController registerEmailController = TextEditingController();
  TextEditingController registerPasswordController = TextEditingController();
  TextEditingController registerPhoneController = TextEditingController();
  TextEditingController registerNameController = TextEditingController();
  var formKeyRegister = GlobalKey<FormState>();
  void register(context) {
    emit(RegisterLoadingState());
    _authRepository
        .register(RegisterRequestModel(
            name: registerNameController.text,
            phone: registerPhoneController.text,
            email: registerEmailController.text,
            password: registerPasswordController.text))
        .then((value) {
      CacheHelper.saveData(key: "token", value: value.data!.token);
      DioHelper.initDioHelper();
      Navigator.pushReplacementNamed(context, Routes.bottomNavBarScreen);
      emit(RegisterSuccessState());
    }).catchError((error) {
      emit(RegisterFailedState());
    });
  }
}
