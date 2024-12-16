part of 'basic_app_cubit.dart';

@immutable
sealed class BasicAppState {}

final class BasicAppInitial extends BasicAppState {}
final class ChangeIndexBottomNavBarState extends BasicAppState {}
