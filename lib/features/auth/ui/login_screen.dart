import 'package:final_project_amit56/core/base_widget/custom_app_bar.dart';
import 'package:final_project_amit56/core/base_widget/custom_button.dart';
import 'package:final_project_amit56/core/base_widget/custom_failure_text.dart';
import 'package:final_project_amit56/core/base_widget/custom_text_form_filed.dart';
import 'package:final_project_amit56/core/helper/spacing.dart';
import 'package:final_project_amit56/core/routing/routes.dart';
import 'package:final_project_amit56/features/auth/logic/auth_cubit.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        var cubit = AuthCubit.get(context);
        return Scaffold(
          appBar: const CustomAppBar(
            title: "Logn In",
          ),
          body: Padding(
            padding: const EdgeInsets.all(12),
            child: Form(
              key: cubit.formKeyLogin,
              child: Column(
                children: [
                  verticleSpace(10),
                  CustomTextFormFiled(
                    prefixIcon: Icons.email_outlined,
                    controller: cubit.loginEmailController,
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
                    controller: cubit.loginPasswordController,
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
                  if (state is LoginFailedState)
                    const CustomFailureText(
                      errorText: "Email or Password Is Invild",
                    ),
                  verticleSpace(40),
                  CustomButton(
                    loading: state is LoginLoadingState,
                    text: 'Login In',
                    function: () {
                      if (cubit.formKeyLogin.currentState!.validate()) {
                        cubit.login(context);
                      }
                    },
                  ),
                  verticleSpace(20),
                  Align(
                    // alignment: Alignment.centerRight,
                    child: Text.rich(TextSpan(
                        text: 'Dont Have Account? ',
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
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (_) => RegisterScreen()));
                                  Navigator.pushNamed(context,Routes.registerScreen);
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
