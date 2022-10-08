// To parse this JSON data, do
//
//     final hotelsearchModel = hotelsearchModelFromJson(jsonString);

import 'dart:convert';

HotelsearchModel hotelsearchModelFromJson(String str) => HotelsearchModel.fromJson(json.decode(str));

String hotelsearchModelToJson(HotelsearchModel data) => json.encode(data.toJson());

class HotelsearchModel {
    HotelsearchModel({
        this.error,
        this.data,
    });

    bool? error;
    List<Datum> ?data;

    factory HotelsearchModel.fromJson(Map<String, dynamic> json) => HotelsearchModel(
        error: json["error"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "error": error,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Datum {
    Datum({
        this.id,
        this.hotelName,
        this.hotelLocation,
        this.hotelDescription,
        this.hotelTags,
        this.hotelDiscount,
        this.hotelPrice,
        this.hotelOfferPrice,
        this.hotelLatitude,
        this.hotelLongitude,
        this.hotelYoutube,
        this.hotelServices,
        this.hotelImages,
        this.contactNo,
        this.isActive,
        this.createdAt,
        this.updatedAt,
        this.fbPage,
        this.website,
        this.email,
    });

    int? id;
    String? hotelName;
    String? hotelLocation;
    String? hotelDescription;
    String? hotelTags;
    String? hotelDiscount;
    String? hotelPrice;
    String? hotelOfferPrice;
    String? hotelLatitude;
    String? hotelLongitude;
    String? hotelYoutube;
    String? hotelServices;
    String? hotelImages;
    String? contactNo;
    String? isActive;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? fbPage;
    String? website;
    String? email;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        hotelName: json["hotel_name"],
        hotelLocation: json["hotel_location"],
        hotelDescription: json["hotel_description"],
        hotelTags: json["hotel_tags"],
        hotelDiscount: json["hotel_discount"],
        hotelPrice: json["hotel_price"],
        hotelOfferPrice: json["hotel_offer_price"],
        hotelLatitude: json["hotel_latitude"],
        hotelLongitude: json["hotel_longitude"],
        hotelYoutube: json["hotel_youtube"],
        hotelServices: json["hotel_services"],
        hotelImages: json["hotel_images"],
        contactNo: json["contact_no"],
        isActive: json["is_active"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        fbPage: json["fb_page"],
        website: json["website"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "hotel_name": hotelName,
        "hotel_location": hotelLocation,
        "hotel_description": hotelDescription,
        "hotel_tags": hotelTags,
        "hotel_discount": hotelDiscount,
        "hotel_price": hotelPrice,
        "hotel_offer_price": hotelOfferPrice,
        "hotel_latitude": hotelLatitude,
        "hotel_longitude": hotelLongitude,
        "hotel_youtube": hotelYoutube,
        "hotel_services": hotelServices,
        "hotel_images": hotelImages,
        "contact_no": contactNo,
        "is_active": isActive,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
        "fb_page": fbPage,
        "website": website,
        "email": email,
    };
}
