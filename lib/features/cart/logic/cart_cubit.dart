import 'package:bloc/bloc.dart';
import '../data/models/carts_model.dart';
import '../data/repository/cart_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final CartRepository _cartRepository;
  CartCubit(this._cartRepository) : super(CartInitial());

  static CartCubit get(context) => BlocProvider.of(context);

  GetCartsModel? cartsModel;
  void getCarts() {
    _cartRepository.getCartsProducts().then((value) {
      cartsModel = value;
      emit(GetCartsSuccessState());
    }).catchError((error) {
      emit(GetCartsFailedState());
    });
  }

  void addCartsProducts(int productId) {
    emit(AddToCartsLoadingState());
    _cartRepository.addCartsProducts(productId).then((value) {
      getCarts();
      emit(AddToCartsSuccessState());
    }).catchError((error) {
      emit(AddToCartsFailedState());
    });
  }

  void updateCartsProducts(int id, int quantity) {
    emit(UpdateToCartsLoadingState());
    _cartRepository.updateCartsProducts(id, quantity).then((value) {
      getCarts();
      emit(UpdateToCartsSuccessState());
    }).catchError((error) {
      emit(UpdateToCartsFailedState());
    });
  }

  void deleteCartsProducts(int id) {
    emit(DeleteToCartsLoadingState());
    _cartRepository.deleteCartsProducts(id).then((value) {
      getCarts();
      emit(DeleteToCartsSuccessState());
    }).catchError((error) {
      emit(DeleteToCartsFailedState());
    });
  }
}
