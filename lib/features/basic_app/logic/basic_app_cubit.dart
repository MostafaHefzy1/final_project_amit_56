import 'package:bloc/bloc.dart';
import 'package:final_project_amit56/core/app_import/app_import.dart';
import 'package:final_project_amit56/features/favorite/logic/favorite_cubit.dart';
import 'package:final_project_amit56/features/favorite/ui/favorite_products_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'basic_app_state.dart';

class BasicAppCubit extends Cubit<BasicAppState> {
  BasicAppCubit() : super(BasicAppInitial());

  static BasicAppCubit get(context) => BlocProvider.of(context);

  List<Widget> screens = [
    HomeScreen(),
    HomeScreen(),
    HomeScreen(),
    FavoriteProductsScreen(),
  ];

  int currentIndex = 0;
  void changeIndexBottomNavBar(int index , context) {
    currentIndex = index;
    if(currentIndex==3){
      FavoriteCubit.get(context).favoritesProduct()  ;
    }
    emit(ChangeIndexBottomNavBarState());

  }
}
