part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ImagePickedSuccessState extends ProfileState {}

final class ImagePickedFailedState extends ProfileState {}


final class GetProfileSuccessState  extends ProfileState {}
final class GetProfileFailedState  extends ProfileState {}
final class FillDataProfileSucceeState  extends ProfileState {}



final class UpdateProfileLoadingState extends ProfileState {}
final class UpdateProfileSuccessState extends ProfileState {}
final class UpdateProfileFailedState extends ProfileState {}




final class ChangePasswordLoadingState extends ProfileState {}
final class ChangePasswordSuccessState extends ProfileState {}
final class ChangePasswordFailedState extends ProfileState {}



