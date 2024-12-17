import '../data/models/banners_model.dart';
import '../data/models/categories_model.dart';
import '../data/models/details_product_model.dart';
import '../data/models/products_model.dart';
import '../data/repository/home_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepository _homeRepository;
  HomeCubit(this._homeRepository) : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);

  BannersModel? bannersModel;
  getBanners() async {
    emit(GetBannersLoadingState());
    await _homeRepository.getBanners().then((value) {
      bannersModel = value;
      emit(GetBannersSuccessState());
    }).catchError((error) {
      emit(GetBannersFailedState());
    });
  }

  List<ProductItem>? list;
  ProductsModel? productsModel;

  ProductsModel? catogeryProductModel;
  void getProducts({int? categoryId}) async {
    emit(GetProductsLoadingState());
    await _homeRepository.getProducts(categoryId: categoryId).then((value) {
      if (categoryId != null) {
        catogeryProductModel = value;
      } else {
        list = value.data!.listProductItem!;
        productsModel = value;
      }

      emit(GetProductsSuccessState());
    }).catchError((error) {
      emit(GetProductsFailedState());
    });
  }

  CategoriesModel? categoriesModel;
  void getCategories() async {
    emit(GetCatogeriesLoadingState());
    await _homeRepository.getCategories().then((value) {
      categoriesModel = value;
      emit(GetCatogeriesSuccessState());
    }).catchError((error) {
      emit(GetCatogeriesFailedState());
    });
  }

  void getDetailsProduct(int productID) async {
    await _homeRepository.getDetailsProduct(productID).then((value) {
      // detailsProductsModel = value;
      emit(GetDetailsSuccessState(value));
    }).catchError((error) {
      emit(GetDetailsFailedState());
    });
  }
}
