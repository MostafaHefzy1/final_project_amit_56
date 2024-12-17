import '../../../../core/app_import/app_import.dart';
import '../../../../core/base_widget/custom_app_bar.dart';
import '../../../../core/base_widget/custom_button.dart';
import '../../../../core/helper/spacing.dart';
import '../../../../core/theming/styles.dart';
import '../../logic/profile_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        var cubit = ProfileCubit.get(context);
        return Scaffold(
          appBar: const CustomAppBar(
            title: "Profile Screen",
            isBack: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                verticleSpace(20),
                Center(
                  child: CircleAvatar(
                      radius: 60,
                      backgroundImage:
                          // Image.network("${cubit.profileModel?.data?.image}").image,
                          NetworkImage("${cubit.profileModel?.data?.image}")),
                ),
                verticleSpace(20),
                Text(
                  cubit.profileModel?.data?.name ?? "",
                  style: TextStyles.font16BrownBold,
                ),
                verticleSpace(5),
                Text(
                  cubit.profileModel?.data?.phone ?? "",
                  style: TextStyles.font16BrownBold,
                ),
                verticleSpace(5),
                Text(
                  cubit.profileModel?.data?.email ?? "",
                  style: TextStyles.font16BrownBold,
                ),
                verticleSpace(40),
                CustomButton(
                  text: "Edit Profile",
                  function: () {
                    Navigator.pushNamed(context, Routes.updateProfileScreen);
                  },
                  
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
