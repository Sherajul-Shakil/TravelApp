// To parse this JSON data, do
//
//     final restorentModel = restorentModelFromJson(jsonString);

import 'dart:convert';

RestorentModel restorentModelFromJson(String str) => RestorentModel.fromJson(json.decode(str));

String restorentModelToJson(RestorentModel data) => json.encode(data.toJson());

class RestorentModel {
    RestorentModel({
        this.error,
        this.data,
    });

    bool? error;
    List<RestorentDatum>? data;

    factory RestorentModel.fromJson(Map<String, dynamic> json) => RestorentModel(
        error: json["error"],
        data: List<RestorentDatum>.from(json["data"].map((x) => RestorentDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "error": error,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class RestorentDatum {
    RestorentDatum({
        this.id,
        this.restaurantName,
        this.restaurantLocation,
        this.restaurantDescription,
        this.restaurantTags,
        this.restaurantLatitude,
        this.restaurantLongitude,
        this.restaurantYoutube,
        this.restaurantImages,
        this.restaurantDiscount,
        this.isActive,
        this.createdAt,
        this.updatedAt,
        this.contactNo,
    });

    int? id;
    String? restaurantName;
    String? restaurantLocation;
    String? restaurantDescription;
    String? restaurantTags;
    String? restaurantLatitude;
    String?restaurantLongitude;
    String ?restaurantYoutube;
    String? restaurantImages;
    String? restaurantDiscount;
    String? isActive;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? contactNo;

    factory RestorentDatum.fromJson(Map<String, dynamic> json) => RestorentDatum(
        id: json["id"],
        restaurantName: json["restaurant_name"],
        restaurantLocation: json["restaurant_location"],
        restaurantDescription: json["restaurant_description"],
        restaurantTags: json["restaurant_tags"],
        restaurantLatitude: json["restaurant_latitude"],
        restaurantLongitude: json["restaurant_longitude"],
        restaurantYoutube: json["restaurant_youtube"],
        restaurantImages: json["restaurant_images"],
        restaurantDiscount: json["restaurant_discount"],
        isActive: json["is_active"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        contactNo: json["contact_no"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "restaurant_name": restaurantName,
        "restaurant_location": restaurantLocation,
        "restaurant_description": restaurantDescription,
        "restaurant_tags": restaurantTags,
        "restaurant_latitude": restaurantLatitude,
        "restaurant_longitude": restaurantLongitude,
        "restaurant_youtube": restaurantYoutube,
        "restaurant_images": restaurantImages,
        "restaurant_discount": restaurantDiscount,
        "is_active": isActive,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "contact_no": contactNo,
    };
}
