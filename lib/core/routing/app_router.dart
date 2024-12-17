import '../../features/basic_app/ui/bottom_nav_bar_screen.dart';
import '../../features/home/data/models/categories_model.dart';
import '../../features/home/data/models/details_product_model.dart';
import '../../features/home/data/models/products_model.dart';
import '../../features/home/ui/product_by_catogery.dart';
import '../../features/home/ui/product_details_screen.dart';
import '../../features/settings/ui/address/address_screen.dart';
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
        return pageRouteBuilder(screen: BottomNavBarScreen());
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
        final ProductItem productItem = settings.arguments as ProductItem;
        return pageRouteBuilder(
            screen: ProductDetailsScreen(
          productItem: productItem,
        ));
      case Routes.profileScreen:
        return pageRouteBuilder(screen: ProfileScreen());
      case Routes.updateProfileScreen:
        return pageRouteBuilder(screen: UpdateProfileScreen());
      case Routes.changePasswordScreen:
        return pageRouteBuilder(screen: ChangePasswordScreen());
      case Routes.addressScreen:
        return pageRouteBuilder(screen: AddressScreen());
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
