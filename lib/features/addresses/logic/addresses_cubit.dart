import 'package:bloc/bloc.dart';
import '../../../core/app_import/app_import.dart';
import '../data/models/addresses_requsest_body.dart';
import '../data/models/get_addresse_model.dart';
import '../data/repository/addresses_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';

part 'addresses_state.dart';

class AddressesCubit extends Cubit<AddressesState> {
  final AddressesRepository _addressesRepository;
  AddressesCubit(this._addressesRepository) : super(AddressesInitial());

  static AddressesCubit get(context) => BlocProvider.of(context);

  GetAddresseModel? getAddresseModel;
  void getAddresses() async {
    await _addressesRepository.getAddresses().then((value) {
      getAddresseModel = value;
      emit(GetAddresseModelSuccessState());
    }).catchError((error) {
      emit(GetAddresseModelFailedState());
    });
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController regionController = TextEditingController();
  TextEditingController detailsnameController = TextEditingController();
  // TextEditingController latitudeController = TextEditingController();
  // TextEditingController longitudeController = TextEditingController();
  TextEditingController notesController = TextEditingController();

  void addAddresses(context) async {
    emit(AddAddressesLoadingState());
    await _addressesRepository
        .addAddresses(AddressesRequsestBody(
            name: nameController.text,
            city: cityController.text,
            region: regionController.text,
            details: detailsnameController.text,
            latitude: position!.latitude.toString(),
            longitude: position!.longitude.toString(),
            notes: notesController.text))
        .then((value) {
      getAddresses();
      Navigator.pop(context);
      clearTextForFiled();
      emit(AddAddressesSuccessState());
    }).catchError((error) {
      emit(AddAddressesFailedState());
    });
  }

  clearTextForFiled() {
    nameController.clear();
    cityController.clear();
    regionController.clear();
    detailsnameController.clear();
    // latitudeController.clear();
    // longitudeController.clear();
    notesController.clear();
  }

  fillTextForFiled(AddresseItem addresseItem) {
    nameController.text = addresseItem.name ?? "";
    cityController.text = addresseItem.city ?? "";
    regionController.text = addresseItem.region ?? "";
    detailsnameController.text = addresseItem.details ?? "";
    notesController.text = addresseItem.notes ?? "";
    // latitudeController.text = addresseItem.latitude.toString();
    // longitudeController.text = addresseItem.longitude.toString();
  }

  void updateAddresses(int idAddress, context) async {
    emit(UpdateAddressesLoadingState());
    await _addressesRepository
        .updateAddresses(AddressesRequsestBody(
            name: nameController.text,
            city: cityController.text,
            region: regionController.text,
            details: detailsnameController.text,
            latitude: position!.latitude.toString(),
            longitude: position!.longitude.toString(),
            notes: notesController.text,
            idAddresse: idAddress))
        .then((value) {
      getAddresses();
      Navigator.pop(context);
      emit(UpdateAddressesSuccessState());
    }).catchError((error) {
      emit(UpdateAddressesFailedState());
    });
  }

  void deleteAddresses(int idAddress, context) async {
    emit(DeleteAddressesLoadingState());
    await _addressesRepository.deleteAddresses(idAddress).then((value) {
      getAddresses();
      Navigator.pop(context);
      emit(DeleteAddressesSuccessState());
    }).catchError((error) {
      emit(DeleteAddressesFailedState());
    });
  }

  Position? position;
  determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.

    position = await Geolocator.getCurrentPosition();

    print("latitude${position!.latitude}");
    print("longitude${position!.longitude}");
  }
}
