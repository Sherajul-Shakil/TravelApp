// To parse this JSON data, do
//
//     final hotels = hotelsFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Hotels hotelsFromJson(String str) => Hotels.fromJson(json.decode(str));

String hotelsToJson(Hotels data) => json.encode(data.toJson());

class Hotels {
  Hotels({
    required this.status,
    required this.message,
    required this.data,
  });

  bool status;
  String message;
  List<HotesDatum> data;

  factory Hotels.fromJson(Map<String, dynamic> json) => Hotels(
        status: json["status"],
        message: json["message"],
        data: List<HotesDatum>.from(
            json["data"].map((x) => HotesDatum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class HotesDatum {
  HotesDatum({
    required this.id,
    required this.name,
    required this.location,
    required this.description,
    required this.price,
    required this.offerPrice,
    required this.discount,
    required this.latitude,
    required this.longitude,
    required this.contactNo,
    required this.isActive,
    required this.email,
    required this.fbPage,
    required this.website,
    required this.youtubeLink,
    required this.createdAt,
    required this.updatedAt,
    required this.hotelPhotos,
    required this.hotelServices,
    required this.hotelRatings,
    required this.hotelTags,
  });

  int id;
  String name;
  String location;
  String description;
  String price;
  String offerPrice;
  String discount;
  String latitude;
  String longitude;
  String contactNo;
  String isActive;
  String email;
  String fbPage;
  String website;
  String youtubeLink;
  dynamic createdAt;
  dynamic updatedAt;
  List<Hotel> hotelPhotos;
  List<Hotel> hotelServices;
  List<dynamic> hotelRatings;
  List<Hotel> hotelTags;

  factory HotesDatum.fromJson(Map<String, dynamic> json) => HotesDatum(
        id: json["id"],
        name: json["name"],
        location: json["location"],
        description: json["description"],
        price: json["price"],
        offerPrice: json["offer_price"],
        discount: json["discount"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        contactNo: json["contact_no"],
        isActive: json["is_active"],
        email: json["email"],
        fbPage: json["fb_page"],
        website: json["website"],
        youtubeLink: json["youtube_link"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
        hotelPhotos: List<Hotel>.from(
            json["hotel_photos"].map((x) => Hotel.fromJson(x))),
        hotelServices: List<Hotel>.from(
            json["hotel_services"].map((x) => Hotel.fromJson(x))),
        hotelRatings: List<dynamic>.from(json["hotel_ratings"].map((x) => x)),
        hotelTags:
            List<Hotel>.from(json["hotel_tags"].map((x) => Hotel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "location": location,
        "description": description,
        "price": price,
        "offer_price": offerPrice,
        "discount": discount,
        "latitude": latitude,
        "longitude": longitude,
        "contact_no": contactNo,
        "is_active": isActive,
        "email": email,
        "fb_page": fbPage,
        "website": website,
        "youtube_link": youtubeLink,
        "created_at": createdAt,
        "updated_at": updatedAt,
        "hotel_photos": List<dynamic>.from(hotelPhotos.map((x) => x.toJson())),
        "hotel_services":
            List<dynamic>.from(hotelServices.map((x) => x.toJson())),
        "hotel_ratings": List<dynamic>.from(hotelRatings.map((x) => x)),
        "hotel_tags": List<dynamic>.from(hotelTags.map((x) => x.toJson())),
      };
}

class Hotel {
  Hotel({
    required this.id,
    required this.name,
    required this.hotelId,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  String hotelId;
  DateTime createdAt;
  DateTime updatedAt;

  factory Hotel.fromJson(Map<String, dynamic> json) => Hotel(
        id: json["id"],
        name: json["name"],
        hotelId: json["hotel_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? DateTime.parse(json["created_at"])
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "hotel_id": hotelId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt == null ? null : updatedAt.toIso8601String(),
      };
}












// // To parse this JSON data, do
// //
// //     final hotels = hotelsFromJson(jsonString);

// import 'dart:convert';

// Hotels hotelsFromJson(String str) => Hotels.fromJson(json.decode(str));

// String hotelsToJson(Hotels data) => json.encode(data.toJson());

// class Hotels {
//     Hotels({
//         this.error,
//         this.data,
//     });

//     bool? error;
//     List<HotesHotesDatum>? data;

//     factory Hotels.fromJson(Map<String, dynamic> json) => Hotels(
//         error: json["error"],
//         data: List<HotesHotesDatum>.from(json["data"].map((x) => HotesHotesDatum.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "error": error,
//         "data": List<dynamic>.from(data!.map((x) => x.toJson())),
//     };
// }

// class HotesHotesDatum {
//     HotesHotesDatum({
//         this.hotelInfo,
//         this.ratingInfo,
//     });

//     HotelInfo? hotelInfo;
//     List<RatingInfo>? ratingInfo;

//     factory HotesHotesDatum.fromJson(Map<String, dynamic> json) => HotesHotesDatum(
//         hotelInfo: HotelInfo.fromJson(json["hotel_info"]),
//         ratingInfo: List<RatingInfo>.from(json["rating_info"].map((x) => RatingInfo.fromJson(x))),
//     );

//     Map<String, dynamic> toJson() => {
//         "hotel_info": hotelInfo!.toJson(),
//         "rating_info": List<dynamic>.from(ratingInfo!.map((x) => x.toJson())),
//     };
// }

// class HotelInfo {
//     HotelInfo({
//         this.id,
//         this.hotelName,
//         this.hotelLocation,
//         this.hotelDescription,
//         this.hotelTags,
//         this.hotelDiscount,
//         this.hotelPrice,
//         this.hotelOfferPrice,
//         this.hotelLatitude,
//         this.hotelLongitude,
//         this.hotelYoutube,
//         this.hotelServices,
//         this.hotelImages,
//         this.isActive,
//         this.createdAt,
//         this.updatedAt,
//     });

//     int? id;
//     String? hotelName;
//     String ?hotelLocation;
//     String? hotelDescription;
//     String? hotelTags;
//     String? hotelDiscount;
//     String? hotelPrice;
//     String? hotelOfferPrice;
//     String? hotelLatitude;
//     String? hotelLongitude;
//     String? hotelYoutube;
//     String? hotelServices;
//     String? hotelImages;
//     String ?isActive;
//     DateTime? createdAt;
//     dynamic updatedAt;

//     factory HotelInfo.fromJson(Map<String, dynamic> json) => HotelInfo(
//         id: json["id"],
//         hotelName: json["hotel_name"],
//         hotelLocation: json["hotel_location"],
//         hotelDescription: json["hotel_description"],
//         hotelTags: json["hotel_tags"],
//         hotelDiscount: json["hotel_discount"],
//         hotelPrice: json["hotel_price"],
//         hotelOfferPrice: json["hotel_offer_price"],
//         hotelLatitude: json["hotel_latitude"],
//         hotelLongitude: json["hotel_longitude"],
//         hotelYoutube: json["hotel_youtube"],
//         hotelServices: json["hotel_services"],
//         hotelImages: json["hotel_images"],
//         isActive: json["is_active"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: json["updated_at"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "hotel_name": hotelName,
//         "hotel_location": hotelLocation,
//         "hotel_description": hotelDescription,
//         "hotel_tags": hotelTags,
//         "hotel_discount": hotelDiscount,
//         "hotel_price": hotelPrice,
//         "hotel_offer_price": hotelOfferPrice,
//         "hotel_latitude": hotelLatitude,
//         "hotel_longitude": hotelLongitude,
//         "hotel_youtube": hotelYoutube,
//         "hotel_services": hotelServices,
//         "hotel_images": hotelImages,
//         "is_active": isActive,
//         "created_at": createdAt!.toIso8601String(),
//         "updated_at": updatedAt,
//     };
// }

// class RatingInfo {
//     RatingInfo({
//         this.id,
//         this.hotelId,
//         this.hotelRoomId,
//         this.userId,
//         this.rating,
//         this.feedback,
//         this.createdAt,
//         this.updatedAt,
//     });

//     int? id;
//     String? hotelId;
//     String? hotelRoomId;
//     String?userId;
//     String?rating;
//     String? feedback;
//     DateTime? createdAt;
//     dynamic updatedAt;

//     factory RatingInfo.fromJson(Map<String, dynamic> json) => RatingInfo(
//         id: json["id"],
//         hotelId: json["hotel_id"],
//         hotelRoomId: json["hotel_room_id"],
//         userId: json["user_id"],
//         rating: json["rating"],
//         feedback: json["feedback"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: json["updated_at"],
//     );

//     Map<String, dynamic> toJson() => {
//         "id": id,
//         "hotel_id": hotelId,
//         "hotel_room_id": hotelRoomId,
//         "user_id": userId,
//         "rating": rating,
//         "feedback": feedback,
//         "created_at": createdAt!.toIso8601String(),
//         "updated_at": updatedAt,
//     };
// }
