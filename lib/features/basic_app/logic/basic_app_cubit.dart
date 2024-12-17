import 'package:bloc/bloc.dart';
import '../../../core/app_import/app_import.dart';
import '../../cart/logic/cart_cubit.dart';
import '../../cart/ui/cart_screen.dart';
import '../../favorite/logic/favorite_cubit.dart';
import '../../favorite/ui/favorite_products_screen.dart';
import '../../settings/logic/profile_cubit.dart';
import '../../settings/ui/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'basic_app_state.dart';

class BasicAppCubit extends Cubit<BasicAppState> {
  BasicAppCubit() : super(BasicAppInitial());

  static BasicAppCubit get(context) => BlocProvider.of(context);

  List<Widget> screens = [
    HomeScreen(),
    CartScreen(),
    FavoriteProductsScreen(),
    SettingScreen(),
  ];

  int currentIndex = 0;
  void changeIndexBottomNavBar(int index, context) {
    currentIndex = index;
    if (currentIndex == 1) {
      CartCubit.get(context).getCarts();
    } else if (currentIndex == 2) {
      FavoriteCubit.get(context).favoritesProduct();
    } else if (currentIndex == 3) {
      ProfileCubit.get(context).getProfile();
    }
    emit(ChangeIndexBottomNavBarState());
  }
}
