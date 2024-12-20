class AddDeleteUpdateAddresseModel {
  bool? status;
  String? message;
  Data? data;

  AddDeleteUpdateAddresseModel({this.status, this.message, this.data});

  AddDeleteUpdateAddresseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
}

class Data {
  int? id;
  String? name;
  String? city;
  String? region;
  String? details;
  String? notes;

  Data({
    this.id,
    this.name,
    this.city,
    this.region,
    this.details,
    this.notes,
  });

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    city = json['city'];
    region = json['region'];
    details = json['details'];
    notes = json['notes'];
  }
}
