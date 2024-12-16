import 'package:bloc/bloc.dart';
import 'package:final_project_amit56/features/favorite/data/model/favorite_product_model.dart';
import 'package:final_project_amit56/features/favorite/data/repository/favorite_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'favorite_state.dart';

class FavoriteCubit extends Cubit<FavoriteState> {
  final FavoriteRepository _favoriteRepository;
  FavoriteCubit(this._favoriteRepository) : super(FavoriteInitial());

  static FavoriteCubit get(context) => BlocProvider.of(context);

  void addOrDeleteFavoriteProduct(int productID) async {
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
