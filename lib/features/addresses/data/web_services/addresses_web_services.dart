import '../../../../core/network/global/dio_helper.dart';
import '../../../../core/network/global/end_point.dart';
import '../models/addresses_requsest_body.dart';

class AddressesWebServices {
  Future<dynamic> addAddresses(
      AddressesRequsestBody addressesRequsestBody) async {
    var response = await DioHelper.postData(
        endPoint: addressesEndPoint, data: addressesRequsestBody.toJson());
    return response.data;
  }

  Future<dynamic> getAddresses() async {
    var response = await DioHelper.getData(endPoint: addressesEndPoint);
    return response.data;
  }

  Future<dynamic> updateAddresses(
      AddressesRequsestBody addressesRequsestBody) async {
    var response = await DioHelper.putData(
        endPoint: "$addressesEndPoint/${addressesRequsestBody.idAddresse}",
        data: addressesRequsestBody.toJson());
    return response.data;
  }

  Future<dynamic> deleteAddresses(int idAddresse) async {
    var response =
        await DioHelper.deleteData(endPoint: "$addressesEndPoint/$idAddresse");
    return response.data;
  }
}
