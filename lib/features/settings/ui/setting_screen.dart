
import '../../../core/app_import/app_import.dart';
import '../../../core/base_widget/custom_app_bar.dart';
import 'widgets/setting_item.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: "Setting Screen"),
      body: Column(
        children: [
          SettingItem(
            iconData: Icons.person_pin_outlined,
            title: "Profile",
            routeName: Routes.profileScreen,
          ),
          SettingItem(
            iconData: Icons.pin_drop_outlined,
            title: "Address",
            routeName: Routes.addressScreen,
          ),
          SettingItem(
            iconData: Icons.password,
            title: "Change Password",
            routeName: Routes.changePasswordScreen,
          ),
        ],
      ),
    );
  }
}
