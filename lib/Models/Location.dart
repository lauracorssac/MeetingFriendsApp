
class Location {

  String address;
  String zipCode;

  @override
  String toString() {

    return address + "-" + zipCode;
  }

  Location({this.address, this.zipCode});

  factory Location.fromJson(Map<String, dynamic> json) {

    return Location(
        address: json['address'],
        zipCode:json['zipCode']
    );

  }

}