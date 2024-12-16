class RegisterRequestModel {
  final String name;
  final String phone;
  final String email;
  final String password;

  RegisterRequestModel(
      {required this.name,
      required this.phone,
      required this.email,
      required this.password});

  Map<String, dynamic> toJson() {
    return {
      "email": email,
      "password": password,
      "phone": phone,
      "name": name,
    };
  }
}
