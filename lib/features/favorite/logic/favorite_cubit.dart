import '../data/model/favorite_product_model.dart';
import '../data/repository/favorite_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/app_import/app_import.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final FavoriteRepository _favoriteRepository;
  FavoriteCubit(this._favoriteRepository) : super(FavoriteInitial());

  static FavoriteCubit get(context) => BlocProvider.of(context);

  void addOrDeleteFavoriteProduct(int productID) async {
    emit(AddOrDeleteFavoriteLoading());
    await _favoriteRepository
        .addOrDeleteFavoriteProduct(productID)
        .then((value) {
      emit(AddOrDeleteFavoriteSuceess());
    }).catchError((error) {
      emit(AddOrDeleteFavoriteFailed());
    });
  }

  FavoriteProductsModel? favoriteProductsModel;
  void favoritesProduct() async {
    await _favoriteRepository.favoritesProduct().then((value) {
      favoriteProductsModel = value;
      emit(GetFavoriteSuceess());
    }).catchError((error) {
      emit(GetFavoriteFailed());
    });
  }
}
