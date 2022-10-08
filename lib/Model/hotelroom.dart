// To parse this JSON data, do
//
//     final hotelRoom = hotelRoomFromJson(jsonString);

import 'dart:convert';

HotelRoom hotelRoomFromJson(String str) => HotelRoom.fromJson(json.decode(str));

String hotelRoomToJson(HotelRoom data) => json.encode(data.toJson());

class HotelRoom {
    HotelRoom({
        this.error,
        this.data,
    });

    bool? error;
    List<HotelroomDatum> ?data;

    factory HotelRoom.fromJson(Map<String, dynamic> json) => HotelRoom(
        error: json["error"],
        data: List<HotelroomDatum>.from(json["data"].map((x) => HotelroomDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "error": error,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class HotelroomDatum {
    HotelroomDatum({
        this.hotelInfo,
        this.ratingInfo,
        this.contactInfo,
    });

    HotelInfo? hotelInfo;
    List<RatingInfo>? ratingInfo;
    ContactInfo? contactInfo;

    factory HotelroomDatum.fromJson(Map<String, dynamic> json) => HotelroomDatum(
        hotelInfo: HotelInfo.fromJson(json["hotel_info"]),
        ratingInfo: List<RatingInfo>.from(json["rating_info"].map((x) => RatingInfo.fromJson(x))),
        contactInfo: ContactInfo.fromJson(json["contact_info"]),
    );

    Map<String, dynamic> toJson() => {
        "hotel_info": hotelInfo!.toJson(),
        "rating_info": List<dynamic>.from(ratingInfo!.map((x) => x.toJson())),
        "contact_info": contactInfo!.toJson(),
    };
}

class ContactInfo {
    ContactInfo({
        this.contactNo,
        this.fbPage,
        this.website,
        this.email,
    });

    String? contactNo;
    String? fbPage;
    String? website;
    String? email;

    factory ContactInfo.fromJson(Map<String, dynamic> json) => ContactInfo(
        contactNo: json["contact_no"],
        fbPage: json["fb_page"],
        website: json["website"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "contact_no": contactNo,
        "fb_page": fbPage,
        "website": website,
        "email": email,
    };
}

class HotelInfo {
    HotelInfo({
        this.id,
        this.hotelId,
        this.roomTitle,
        this.roomSubtitle,
        this.roomDescription,
        this.roomTags,
        this.roomImages,
        this.roomDiscount,
        this.roomPrice,
        this.roomDiscountPrice,
        this.roomTotal,
        this.roomServices,
        this.roomPrivatePolicy,
        this.roomInfo,
        this.createdAt,
        this.updatedAt,
    });

    int? id;
    String? hotelId;
    String? roomTitle;
    String? roomSubtitle;
    String? roomDescription;
    String? roomTags;
    String? roomImages;
    String? roomDiscount;
    String? roomPrice;
    String? roomDiscountPrice;
    String? roomTotal;
    String? roomServices;
    String? roomPrivatePolicy;
    String? roomInfo;
    DateTime? createdAt;
    DateTime? updatedAt;

    factory HotelInfo.fromJson(Map<String, dynamic> json) => HotelInfo(
        id: json["id"],
        hotelId: json["hotel_id"],
        roomTitle: json["room_title"],
        roomSubtitle: json["room_subtitle"],
        roomDescription: json["room_description"],
        roomTags: json["room_tags"],
        roomImages: json["room_images"],
        roomDiscount: json["room_discount"],
        roomPrice: json["room_price"],
        roomDiscountPrice: json["room_discount_price"],
        roomTotal: json["room_total"],
        roomServices: json["room_services"],
        roomPrivatePolicy: json["room_private_policy"],
        roomInfo: json["room_info"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null ? null : DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "hotel_id": hotelId,
        "room_title": roomTitle,
        "room_subtitle": roomSubtitle,
        "room_description": roomDescription,
        "room_tags": roomTags,
        "room_images": roomImages,
        "room_discount": roomDiscount,
        "room_price": roomPrice,
        "room_discount_price": roomDiscountPrice,
        "room_total": roomTotal,
        "room_services": roomServices,
        "room_private_policy": roomPrivatePolicy,
        "room_info": roomInfo,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt!.toIso8601String(),
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
    String ?hotelRoomId;
    String? userId;
    String? rating;
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
