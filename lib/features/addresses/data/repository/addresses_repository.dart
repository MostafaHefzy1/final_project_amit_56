import '../models/add_delete_update_addresse_model.dart';
import '../models/addresses_requsest_body.dart';
import '../models/get_addresse_model.dart';
import '../web_services/addresses_web_services.dart';

class AddressesRepository {
  final AddressesWebServices _addressesWebServices;

  AddressesRepository(this._addressesWebServices);

  Future<GetAddresseModel> getAddresses() async {
    return GetAddresseModel.fromJson(
        await _addressesWebServices.getAddresses());
  }

  Future<AddDeleteUpdateAddresseModel> addAddresses(
      AddressesRequsestBody addressesRequsestBody) async {
    return AddDeleteUpdateAddresseModel.fromJson(
        await _addressesWebServices.addAddresses(addressesRequsestBody));
  }

  Future<AddDeleteUpdateAddresseModel> updateAddresses(
      AddressesRequsestBody addressesRequsestBody) async {
    return AddDeleteUpdateAddresseModel.fromJson(
        await _addressesWebServices.updateAddresses(addressesRequsestBody));
  }

  Future<AddDeleteUpdateAddresseModel> deleteAddresses(int idAddresse) async {
    return AddDeleteUpdateAddresseModel.fromJson(
        await _addressesWebServices.deleteAddresses(idAddresse));
  }
}
