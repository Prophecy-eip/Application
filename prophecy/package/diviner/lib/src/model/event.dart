import 'dart:convert';

Event eventFromJson(String str) => Event.fromJson(json.decode(str));

String eventToJson(Event data) => json.encode(data.toJson());

class Event {
  Event({
    required this.ownerId,
    required this.name,
    required this.description,
    required this.tag,
    required this.dateTime,
    required this.link,
    required this.address,
    required this.locationId,
    required this.contact,
  });

  String ownerId;
  String name;
  String description;
  String tag;
  String dateTime;
  String link;
  Address address;
  String locationId;
  Contact contact;

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        ownerId: json["ownerId"],
        name: json["name"],
        description: json["description"],
        tag: json["tag"],
        dateTime: json["dateTime"],
        link: json["link"],
        address: Address.fromJson(json["address"]),
        locationId: json["locationId"],
        contact: Contact.fromJson(json["contact"]),
      );

  Map<String, dynamic> toJson() => {
        "ownerId": ownerId,
        "name": name,
        "description": description,
        "tag": tag,
        "dateTime": dateTime,
        "link": link,
        "address": address.toJson(),
        "locationId": locationId,
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
