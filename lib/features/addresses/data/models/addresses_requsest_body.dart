class AddressesRequsestBody {
  final int? idAddresse;
  final String name;
  final String city;
  final String region;
  final String details;
  final String latitude;
  final String longitude;
  final String notes;

  AddressesRequsestBody(
      {this.idAddresse,
      required this.name,
      required this.city,
      required this.region,
      required this.details,
      required this.latitude,
      required this.longitude,
      required this.notes});

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "city": city,
      "region": region,
      "details": details,
      "latitude": latitude,
      "longitude": longitude,
      "notes": notes,
    };
  }
}
