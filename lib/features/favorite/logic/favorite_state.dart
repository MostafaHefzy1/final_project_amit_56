part of 'favorite_cubit.dart';

@immutable
sealed class FavoriteState {}

final class FavoriteInitial extends FavoriteState {}


final class AddOrDeleteFavoriteSuceess extends FavoriteState {}
final class AddOrDeleteFavoriteFailed extends FavoriteState {}

final class GetFavoriteSuceess extends FavoriteState {}
final class GetFavoriteFailed extends FavoriteState {}