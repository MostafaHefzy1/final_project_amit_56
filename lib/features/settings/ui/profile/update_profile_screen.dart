import 'dart:io';

import '../../../../core/base_widget/custom_app_bar.dart';
import '../../../../core/base_widget/custom_button.dart';
import '../../../../core/base_widget/custom_text_form_filed.dart';
import '../../../../core/helper/spacing.dart';
import '../../logic/profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateProfileScreen extends StatelessWidget {
  const UpdateProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        var cubit = ProfileCubit.get(context);
        return Scaffold(
          appBar: CustomAppBar(title: "Update Profile"),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    cubit.getImageUser();
                  },
                  child: Center(
                    child: CircleAvatar(
                        radius: 60,
                        backgroundImage: cubit.imageFile == null
                            ? NetworkImage("${cubit.profileModel?.data?.image}")
                            : Image.file(File(cubit.imageFile!.path)).image),
                  ),
                ),
                verticleSpace(10),
                CustomTextFormFiled(
                  prefixIcon: Icons.person_pin_outlined,
                  controller: cubit.nameController,
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
                  controller: cubit.phoneController,
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
                  controller: cubit.emailController,
                  hintText: "Email",
                  validator: (value) {
                    if (value.isEmpty) {
                      return "This Filed is Required";
                    }
                  },
                ),
                verticleSpace(10),
                CustomButton(
                    text: "Update Profile",
                    function: () {
                      cubit.updateProfileScreen();
                    })
              ],
            ),
          ),
        );
      },
    );
  }
}
