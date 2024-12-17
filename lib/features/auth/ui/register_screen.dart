import '../../../core/base_widget/custom_app_bar.dart';
import '../../../core/base_widget/custom_button.dart';
import '../../../core/base_widget/custom_text_form_filed.dart';
import '../../../core/helper/spacing.dart';
import '../../../core/routing/routes.dart';
import '../logic/auth_cubit.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        var cubit = AuthCubit.get(context);
        return Scaffold(
          appBar: const CustomAppBar(
            title: "Register Screen",
          ),
          body: Padding(
            padding: const EdgeInsets.all(12),
            child: Form(
              key: cubit.formKeyRegister,
              child: Column(
                children: [
                  verticleSpace(10),
                  CustomTextFormFiled(
                    prefixIcon: Icons.person_pin_outlined,
                    controller: cubit.registerNameController,
                    hintText: "Name",
                    validator: (value) {
                      if (value.isEmpty) {
                        return "This Filed is Required";
                      }
                    },
                  ),
                  verticleSpace(10),
                  CustomTextFormFiled(
                    prefixIcon: Icons.phone_android_outlined,
                    controller: cubit.registerPhoneController,
                    hintText: "Phone",
                    validator: (value) {
                      if (value.isEmpty) {
                        return "This Filed is Required";
                      }
                    },
                  ),
                  verticleSpace(10),
                  CustomTextFormFiled(
                    prefixIcon: Icons.email_outlined,
                    controller: cubit.registerEmailController,
                    hintText: "Email",
                    validator: (value) {
                      if (value.isEmpty) {
                        return "This Filed is Required";
                      }
                    },
                  ),
                  verticleSpace(10),
                  CustomTextFormFiled(
                    prefixIcon: Icons.lock_outline_rounded,
                    controller: cubit.registerPasswordController,
                    suffixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.visibility_off_rounded)),
                    hintText: "Password",
                    validator: (value) {
                      if (value.isEmpty) {
                        return "This Filed is Required";
                      }
                    },
                  ),
                  verticleSpace(40),
                  CustomButton(
                    loading: state is RegisterLoadingState,
                    text: 'Register',
                    function: () {
                      if (cubit.formKeyRegister.currentState!.validate()) {
                        cubit.register(context);
                      }
                    },
                  ),
                  verticleSpace(20),
                  Align(
                    // alignment: Alignment.centerRight,
                    child: Text.rich(TextSpan(
                        text: 'Have Account? ',
                        style: const TextStyle(color: Colors.black),
                        children: [
                          TextSpan(
                              text: "Click Here",
                              style: const TextStyle(
                                  color: Colors.brown,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushNamed(
                                      context, Routes.loginScreen);
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (_) => const LoginScreen()));
                                }),
                        ])),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
