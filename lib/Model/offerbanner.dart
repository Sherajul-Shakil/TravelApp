// To parse this JSON data, do
//
//     final offerbanner = offerbannerFromJson(jsonString);

import 'dart:convert';

Offerbanner offerbannerFromJson(String str) => Offerbanner.fromJson(json.decode(str));

String offerbannerToJson(Offerbanner data) => json.encode(data.toJson());

class Offerbanner {
    Offerbanner({
        this.error,
        this.data,
    });

    bool? error;
    List<OfferbannerDatum>? data;

    factory Offerbanner.fromJson(Map<String, dynamic> json) => Offerbanner(
        error: json["error"],
        data: List<OfferbannerDatum>.from(json["data"].map((x) => OfferbannerDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "error": error,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class OfferbannerDatum {
    OfferbannerDatum({
        this.id,
        this.title,
        this.bannerPhoto,
        this.createdAt,
        this.updatedAt,
    });

    int? id;
    String ?title;
    String? bannerPhoto;
    DateTime? createdAt;
    dynamic updatedAt;

    factory OfferbannerDatum.fromJson(Map<String, dynamic> json) => OfferbannerDatum(
        id: json["id"],
        title: json["title"],
        bannerPhoto: json["banner_photo"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "banner_photo": bannerPhoto,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt,
    };
}
