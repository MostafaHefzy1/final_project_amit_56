part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class GetBannersLoadingState extends HomeState {}

final class GetBannersSuccessState extends HomeState {}

final class GetBannersFailedState extends HomeState {}

final class GetProductsLoadingState extends HomeState {}

final class GetProductsSuccessState extends HomeState {}

final class GetProductsFailedState extends HomeState {}

final class GetCatogeriesLoadingState extends HomeState {}

final class GetCatogeriesSuccessState extends HomeState {}

final class GetCatogeriesFailedState extends HomeState {}

final class GetDetailsLoadingState extends HomeState {}

final class GetDetailsSuccessState extends HomeState {
  final DetailsProductsModel detailsProductsModel;

  GetDetailsSuccessState(this.detailsProductsModel);
}

final class GetDetailsFailedState extends HomeState {}
