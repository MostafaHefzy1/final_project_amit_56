part of 'addresses_cubit.dart';

@immutable
sealed class AddressesState {}

final class AddressesInitial extends AddressesState {}


final class GetAddresseModelSuccessState extends AddressesState {}
final class GetAddresseModelFailedState extends AddressesState {}



final class AddAddressesLoadingState extends AddressesState {}
final class AddAddressesSuccessState extends AddressesState {}
final class AddAddressesFailedState extends AddressesState {}




final class UpdateAddressesLoadingState extends AddressesState {}
final class UpdateAddressesSuccessState extends AddressesState {}
final class UpdateAddressesFailedState extends AddressesState {}



final class DeleteAddressesLoadingState extends AddressesState {}
final class DeleteAddressesSuccessState extends AddressesState {}
final class DeleteAddressesFailedState extends AddressesState {}

