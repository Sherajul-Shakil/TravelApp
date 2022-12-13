// To parse this JSON data, do
//
//     final holtelModel = holtelModelFromJson(jsonString);

import 'dart:convert';

HoltelModel holtelModelFromJson(String str) =>
    HoltelModel.fromJson(json.decode(str));

String holtelModelToJson(HoltelModel data) => json.encode(data.toJson());

class HoltelModel {
  HoltelModel({
    this.status,
    this.message,
    this.data,
  });

  bool? status;
  String? message;
  Data? data;

  factory HoltelModel.fromJson(Map<String, dynamic> json) => HoltelModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data!.toJson(),
      };

  @override
  String toString() {
    return 'HoltelModel{status: $status, message: $message, data: $data}';
  }
}

class Data {
  Data({
    this.campaign,
    this.popularDeals,
  });

  List<Campaign>? campaign;
  List<PopularDeal>? popularDeals;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        campaign: List<Campaign>.from(
            json["campaign"].map((x) => Campaign.fromJson(x))),
        popularDeals: List<PopularDeal>.from(
            json["popular_deals"].map((x) => PopularDeal.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "campaign": List<dynamic>.from(campaign!.map((x) => x.toJson())),
        "popular_deals":
            List<dynamic>.from(popularDeals!.map((x) => x.toJson())),
      };

  @override
  String toString() {
    return 'Data{campaign: $campaign, popularDeals: $popularDeals}';
  }
}

class Campaign {
  Campaign({
    this.id,
    this.title,
    this.campaignType,
    this.bannerPhoto,
    this.status,
    this.campaignDescription,
  });

  int? id;
  String? title;
  String? campaignType;
  String? bannerPhoto;
  String? status;
  String? campaignDescription;

  factory Campaign.fromJson(Map<String, dynamic> json) => Campaign(
        id: json["id"],
        title: json["title"],
        campaignType: json["campaign_type"],
        bannerPhoto: json["banner_photo"],
        status: json["status"],
        campaignDescription: json["campaign_description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "campaign_type": campaignType,
        "banner_photo": bannerPhoto,
        "status": status,
        "campaign_description": campaignDescription,
      };

  @override
  String toString() {
    return 'Campaign{id: $id, title: $title, campaignType: $campaignType, bannerPhoto: $bannerPhoto, status: $status, campaignDescription: $campaignDescription}';
  }
}

class PopularDeal {
  PopularDeal({
    this.id,
    this.image,
    this.name,
    this.location,
    this.price,
    this.offerPrice,
    this.discount,
    this.rating,
    this.totalRating,
    this.tags,
    this.type,
  });

  int? id;
  String? image;
  String? name;
  String? location;
  double? price;
  int? offerPrice;
  int? discount;
  double? rating;
  int? totalRating;
  List<String>? tags;
  String? type;

  factory PopularDeal.fromJson(Map<String, dynamic> json) => PopularDeal(
        id: json["id"],
        image: json["image"],
        name: json["name"],
        location: json["location"],
        price: json["price"] == null ? null : json["price"].toDouble(),
        offerPrice: json["offer_price"] == null ? null : json["offer_price"],
        discount: json["discount"],
        rating: json["rating"].toDouble(),
        totalRating: json["total_rating"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "name": name,
        "location": location,
        "price": price == null ? null : price,
        "offer_price": offerPrice == null ? null : offerPrice,
        "discount": discount,
        "rating": rating,
        "total_rating": totalRating,
        "tags": List<dynamic>.from(tags!.map((x) => x)),
        "type": type,
      };

  @override
  String toString() {
    return 'PopularDeal{id: $id, image: $image, name: $name, location: $location, price: $price, offerPrice: $offerPrice, discount: $discount, rating: $rating, totalRating: $totalRating, tags: $tags, type: $type}';
  }
}
