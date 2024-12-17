import '../../../../core/base_widget/custom_app_bar.dart';
import '../../../../core/base_widget/custom_button.dart';
import '../../../../core/base_widget/custom_text_form_filed.dart';
import '../../../../core/helper/spacing.dart';
import '../../logic/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        var cubit = ProfileCubit.get(context);
        return Scaffold(
          appBar: const CustomAppBar(
            title: "Change Password",
            isBack: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                verticleSpace(10),
                CustomTextFormFiled(
                  prefixIcon: Icons.lock_outline,
                  controller: cubit.currentPasswordController,
                  hintText: "Current Password",
                  validator: (value) {
                    if (value.isEmpty) {
                      return "This Filed is Required";
                    }
                  },
                ),
                verticleSpace(10),
                CustomTextFormFiled(
                  prefixIcon: Icons.lock_outline,
                  controller: cubit.newPasswordController,
                  hintText: "New Password",
                  validator: (value) {
                    if (value.isEmpty) {
                      return "This Filed is Required";
                    }
                  },
                ),
                verticleSpace(10),
                CustomButton(
                    loading: state is ChangePasswordLoadingState,
                    text: "Change Password",
                    function: () {
                      cubit.changePassword();
                    })
              ],
            ),
          ),
        );
      },
    );
  }
}
