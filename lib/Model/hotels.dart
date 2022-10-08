// To parse this JSON data, do
//
//     final hotels = hotelsFromJson(jsonString);

import 'dart:convert';

Hotels hotelsFromJson(String str) => Hotels.fromJson(json.decode(str));

String hotelsToJson(Hotels data) => json.encode(data.toJson());

class Hotels {
    Hotels({
        this.error,
        this.data,
    });

    bool? error;
    List<HotesDatum>? data;

    factory Hotels.fromJson(Map<String, dynamic> json) => Hotels(
        error: json["error"],
        data: List<HotesDatum>.from(json["data"].map((x) => HotesDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "error": error,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class HotesDatum {
    HotesDatum({
        this.hotelInfo,
        this.ratingInfo,
    });

    HotelInfo? hotelInfo;
    List<RatingInfo>? ratingInfo;

    factory HotesDatum.fromJson(Map<String, dynamic> json) => HotesDatum(
        hotelInfo: HotelInfo.fromJson(json["hotel_info"]),
        ratingInfo: List<RatingInfo>.from(json["rating_info"].map((x) => RatingInfo.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "hotel_info": hotelInfo!.toJson(),
        "rating_info": List<dynamic>.from(ratingInfo!.map((x) => x.toJson())),
    };
}

class HotelInfo {
    HotelInfo({
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
        this.isActive,
        this.createdAt,
        this.updatedAt,
    });

    int? id;
    String? hotelName;
    String ?hotelLocation;
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
    String ?isActive;
    DateTime? createdAt;
    dynamic updatedAt;

    factory HotelInfo.fromJson(Map<String, dynamic> json) => HotelInfo(
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
        isActive: json["is_active"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
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
        "is_active": isActive,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt,
    };
}

class RatingInfo {
    RatingInfo({
        this.id,
        this.hotelId,
        this.hotelRoomId,
        this.userId,
        this.rating,
        this.feedback,
        this.createdAt,
        this.updatedAt,
    });

    int? id;
    String? hotelId;
    String? hotelRoomId;
    String?userId;
    String?rating;
    String? feedback;
    DateTime? createdAt;
    dynamic updatedAt;

    factory RatingInfo.fromJson(Map<String, dynamic> json) => RatingInfo(
        id: json["id"],
        hotelId: json["hotel_id"],
        hotelRoomId: json["hotel_room_id"],
        userId: json["user_id"],
        rating: json["rating"],
        feedback: json["feedback"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "hotel_id": hotelId,
        "hotel_room_id": hotelRoomId,
        "user_id": userId,
        "rating": rating,
        "feedback": feedback,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt,
    };
}
