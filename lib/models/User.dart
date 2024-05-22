class User {
  final int id;
  final String username;
  final String email;
  final Address address;

  User(
      {required this.id,
      required this.username,
      required this.email,
      required this.address});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        id: json['id'],
        username: json['username'],
        email: json['email'],
        address: Address(
            street: json['address']['street'],
            suite: json['address']['suite'],
            city: json['address']['city'],
            zipcode: json['address']['zipcode']));
  }
}

class Address {
  final String street;
  final String suite;
  final String city;
  final String zipcode;

  Address(
      {required this.street,
      required this.suite,
      required this.city,
      required this.zipcode});
}
