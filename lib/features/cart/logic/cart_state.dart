part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}


final class GetCartsSuccessState extends CartState {}
final class GetCartsFailedState extends CartState {}




final class AddToCartsLoadingState extends CartState {}
final class AddToCartsSuccessState extends CartState {}
final class AddToCartsFailedState extends CartState {}


final class UpdateToCartsLoadingState extends CartState {}
final class UpdateToCartsSuccessState extends CartState {}
final class UpdateToCartsFailedState extends CartState {}

final class DeleteToCartsLoadingState extends CartState {}
final class DeleteToCartsSuccessState extends CartState {}
final class DeleteToCartsFailedState extends CartState {}