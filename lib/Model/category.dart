// To parse this JSON data, do
//
//     final category = categoryFromJson(jsonString);

import 'dart:convert';

Category categoryFromJson(String str) => Category.fromJson(json.decode(str));

String categoryToJson(Category data) => json.encode(data.toJson());

class Category {
    Category({
        this.error,
        this.data,
    });

    bool? error;
    List<CategoryDatum> ?data;

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        error: json["error"],
        data: List<CategoryDatum>.from(json["data"].map((x) => CategoryDatum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "error": error,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class CategoryDatum {
    CategoryDatum({
        this.id,
        this.categoryTitle,
        this.categoryIcon,
        this.createdAt,
        this.updatedAt,
    });

    int? id;
    String ?categoryTitle;
    String? categoryIcon;
    DateTime? createdAt;
    dynamic updatedAt;

    factory CategoryDatum.fromJson(Map<String, dynamic> json) => CategoryDatum(
        id: json["id"],
        categoryTitle: json["category_title"],
        categoryIcon: json["category_icon"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "category_title": categoryTitle,
        "category_icon": categoryIcon,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt,
    };
}
