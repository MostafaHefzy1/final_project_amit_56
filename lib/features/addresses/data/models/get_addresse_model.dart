class GetAddresseModel {
  bool? status;
  Data? data;

  GetAddresseModel({this.status,  this.data});

  GetAddresseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  List<AddresseItem>? addresseItem;

  String? nextPageUrl;

  Data({
    this.addresseItem,
    this.nextPageUrl,
  });

  Data.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      addresseItem = <AddresseItem>[];
      json['data'].forEach((v) {
        addresseItem!.add(AddresseItem.fromJson(v));
      });
    }

    nextPageUrl = json['next_page_url'];
  }
}

class AddresseItem {
  int? id;
  String? name;
  String? city;
  String? region;
  String? details;
  String? notes;
  double? latitude;
  double? longitude;

  AddresseItem(
      {this.id,
      this.name,
      this.city,
      this.region,
      this.details,
      this.notes,
      this.latitude,
      this.longitude});

  AddresseItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    city = json['city'];
    region = json['region'];
    details = json['details'];
    notes = json['notes'];
    latitude = json['latitude'].toDouble();
    longitude = json['longitude'].toDouble();
  }
}
