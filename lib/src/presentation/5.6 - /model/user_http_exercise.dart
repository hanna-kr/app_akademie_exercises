class User2 {
  String name;
  String email;
  String city;
  String streetName;
  String zipCode;

  User2(
      {required this.name,
      required this.email,
      required this.city,
      required this.streetName,
      required this.zipCode});

  factory User2.fromJson(Map<String, dynamic> json) => User2(
      name: json["name"],
      email: json["email"],
      city: json["address"]["city"],
      streetName: json["address"]["street"],
      zipCode: json["address"]["zipcode"]);
}
