import '../../features/addresses/ui/add_update_delete_address_model.dart';

import '../../features/basic_app/ui/bottom_nav_bar_screen.dart';
import '../../features/home/data/models/categories_model.dart';
import '../../features/home/ui/product_by_catogery.dart';
import '../../features/home/ui/product_details_screen.dart';
import '../../features/addresses/ui/address_screen.dart';
import '../../features/settings/ui/change_password/change_password_screen.dart';
import '../../features/settings/ui/profile/profile_screen.dart';
import '../../features/settings/ui/profile/update_profile_screen.dart';

import '../app_import/app_import.dart';

class AppRouter {
  static Route<dynamic>? genrateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.loginScreen:
        return pageRouteBuilder(screen: const LoginScreen());

      case Routes.registerScreen:
        return pageRouteBuilder(screen: const RegisterScreen());

      case Routes.bottomNavBarScreen:
        return pageRouteBuilder(screen: const BottomNavBarScreen());
      case Routes.homeScreen:
        return pageRouteBuilder(screen: HomeScreen());

      case Routes.productByCatogery:
        final CategoriesItem categoriesItem =
            settings.arguments as CategoriesItem;
        return pageRouteBuilder(
            screen: ProductByCatogery(
          categoriesItem: categoriesItem,
        ));

      case Routes.productDetailsScreen:
        final int  productId = settings.arguments as int ;
        return pageRouteBuilder(
            screen: ProductDetailsScreen(
          productId: productId,
        ));
      case Routes.profileScreen:
        return pageRouteBuilder(screen: ProfileScreen());
      case Routes.updateProfileScreen:
        return pageRouteBuilder(screen: const UpdateProfileScreen());
      case Routes.changePasswordScreen:
        return pageRouteBuilder(screen: const ChangePasswordScreen());
      case Routes.addressScreen:
        return pageRouteBuilder(screen: const AddressScreen());
      case Routes.addUpdateDeleteAddressScreen:
        final dynamic addresseItem = settings.arguments as dynamic;
        return pageRouteBuilder(
            screen: AddUpdateDeleteAddressScreen(addresseItem: addresseItem));
    }
    return null;
  }

  static PageRouteBuilder pageRouteBuilder({required Widget screen}) {
    return PageRouteBuilder(pageBuilder: (BuildContext context,
        Animation<double> animation, Animation<double> secondaryAnimation) {
      const begin = Offset(-1, 0);
      const end = Offset.zero;
      const curve = Curves.ease;
      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      return SlideTransition(position: animation.drive(tween), child: screen);
    });
  }
}
