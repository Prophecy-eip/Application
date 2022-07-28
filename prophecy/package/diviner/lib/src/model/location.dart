import 'dart:convert';

Location locationFromJson(String str) => Location.fromJson(json.decode(str));

String locationToJson(Location data) => json.encode(data.toJson());

class Location {
  Location({
    required this.name,
    required this.description,
    required this.address,
    required this.website,
    required this.contact,
  });

  String name;
  String description;
  Address address;
  String website;
  Contact contact;

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: json["name"],
        description: json["description"],
        address: Address.fromJson(json["address"]),
        website: json["website"],
        contact: Contact.fromJson(json["contact"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "description": description,
        "address": address.toJson(),
        "website": website,
        "contact": contact.toJson(),
      };
}

class Address {
  Address({
    required this.number,
    required this.street,
    required this.city,
    required this.postalCode,
    required this.country,
  });

  int number;
  String street;
  String city;
  int postalCode;
  String country;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        number: json["number"],
        street: json["street"],
        city: json["city"],
        postalCode: json["postalCode"],
        country: json["country"],
      );

  Map<String, dynamic> toJson() => {
        "number": number,
        "street": street,
        "city": city,
        "postalCode": postalCode,
        "country": country,
      };
}

class Contact {
  Contact({
    required this.phone,
    required this.emailAddress,
  });

  String phone;
  String emailAddress;

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
        phone: json["phone"],
        emailAddress: json["emailAddress"],
      );

  Map<String, dynamic> toJson() => {
        "phone": phone,
        "emailAddress": emailAddress,
      };
}
