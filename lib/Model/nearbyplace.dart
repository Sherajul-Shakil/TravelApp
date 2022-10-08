// To parse this JSON data, do
//
//     final nearbyplace = nearbyplaceFromJson(jsonString);

import 'dart:convert';

Nearbyplace nearbyplaceFromJson(String str) =>
    Nearbyplace.fromJson(json.decode(str));

String nearbyplaceToJson(Nearbyplace data) => json.encode(data.toJson());

class Nearbyplace {
  Nearbyplace({
    this.places,
    this.status,
  });

  List<Place>? places;
  int? status;

  factory Nearbyplace.fromJson(Map<String, dynamic> json) => Nearbyplace(
        places: List<Place>.from(json["Place"].map((x) => Place.fromJson(x))),
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "Place": List<dynamic>.from(places!.map((x) => x.toJson())),
        "status": status,
      };
}

class Place {
  Place({
    this.id,
    this.name,
    this.distanceInMeters,
    this.longitude,
    this.latitude,
    this.pType,
    this.address,
    this.area,
    this.city,
    this.postCode,
    this.subType,
    this.uCode,
    this.stAsTextLocation,
  });

  int? id;
  String? name;
  double? distanceInMeters;
  String? longitude;
  String? latitude;
  String? pType;
  String? address;
  String? area;
  String? city;
  int? postCode;
  String? subType;
  String? uCode;
  String? stAsTextLocation;

  factory Place.fromJson(Map<String, dynamic> json) => Place(
        id: json["id"],
        name: json["name"],
        distanceInMeters: json["distance_in_meters"].toDouble(),
        longitude: json["longitude"],
        latitude: json["latitude"],
        pType: json["pType"],
        address: json["Address"],
        area: json["area"],
        city: json["city"],
        postCode: json["postCode"],
        subType: json["subType"],
        uCode: json["uCode"],
        stAsTextLocation: json["ST_AsText(location)"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "distance_in_meters": distanceInMeters,
        "longitude": longitude,
        "latitude": latitude,
        "pType": pType,
        "Address": address,
        "area": area,
        "city": city,
        "postCode": postCode,
        "subType": subType,
        "uCode": uCode,
        "ST_AsText(location)": stAsTextLocation,
      };
}
