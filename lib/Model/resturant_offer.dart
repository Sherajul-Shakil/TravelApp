// To parse this JSON data, do
//
//     final resturantoffer = resturantofferFromJson(jsonString);

import 'dart:convert';

Resturantoffer resturantofferFromJson(String str) => Resturantoffer.fromJson(json.decode(str));

String resturantofferToJson(Resturantoffer data) => json.encode(data.toJson());

class Resturantoffer {
    Resturantoffer({
        this.error,
        this.data,
    });

    bool? error;
    List<ResturantDatum>? data;

    factory Resturantoffer.fromJson(Map<String, dynamic> json) => Resturantoffer(
        error: json["error"],
        data: List<ResturantDatum>.from(json["data"].map((x) => ResturantDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "error": error,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class ResturantDatum {
    ResturantDatum({
        this.id,
        this.title,
        this.bannerImages,
        this.isActive,
        this.createdAt,
        this.updatedAt,
    });

    int? id;
    String? title;
    String? bannerImages;
    String? isActive;
    DateTime? createdAt;
    DateTime? updatedAt;

    factory ResturantDatum.fromJson(Map<String, dynamic> json) => ResturantDatum(
        id: json["id"],
        title: json["title"],
        bannerImages: json["banner_images"],
        isActive: json["is_active"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "banner_images": bannerImages,
        "is_active": isActive,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
    };
}
