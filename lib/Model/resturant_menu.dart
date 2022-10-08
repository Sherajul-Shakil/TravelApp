// To parse this JSON data, do
//
//     final resturantMenu = resturantMenuFromJson(jsonString);

import 'dart:convert';

ResturantMenu resturantMenuFromJson(String str) => ResturantMenu.fromJson(json.decode(str));

String resturantMenuToJson(ResturantMenu data) => json.encode(data.toJson());

class ResturantMenu {
    ResturantMenu({
        this.error,
        this.data,
    });

    bool? error;
    List<ResturantMenuDatum>? data;

    factory ResturantMenu.fromJson(Map<String, dynamic> json) => ResturantMenu(
        error: json["error"],
        data: List<ResturantMenuDatum>.from(json["data"].map((x) => ResturantMenuDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "error": error,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class ResturantMenuDatum {
    ResturantMenuDatum({
        this.id,
        this.restaurantId,
        this.menuName,
        this.menuDescription,
        this.menuTags,
        this.menuImages,
        this.menuDiscount,
        this.isActive,
        this.createdAt,
        this.updatedAt,
    });

    int? id;
    String? restaurantId;
    String? menuName;
    String? menuDescription;
    String? menuTags;
    String? menuImages;
    String? menuDiscount;
    String? isActive;
    DateTime? createdAt;
    DateTime? updatedAt;

    factory ResturantMenuDatum.fromJson(Map<String, dynamic> json) => ResturantMenuDatum(
        id: json["id"],
        restaurantId: json["restaurant_id"],
        menuName: json["menu_name"],
        menuDescription: json["menu_description"],
        menuTags: json["menu_tags"],
        menuImages: json["menu_images"],
        menuDiscount: json["menu_discount"],
        isActive: json["is_active"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "restaurant_id": restaurantId,
        "menu_name": menuName,
        "menu_description": menuDescription,
        "menu_tags": menuTags,
        "menu_images": menuImages,
        "menu_discount": menuDiscount,
        "is_active": isActive,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
    };
}
