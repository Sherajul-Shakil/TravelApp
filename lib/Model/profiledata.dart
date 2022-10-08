// To parse this JSON data, do
//
//     final profileData = profileDataFromJson(jsonString);

import 'dart:convert';

ProfileData profileDataFromJson(String str) => ProfileData.fromJson(json.decode(str));

String profileDataToJson(ProfileData data) => json.encode(data.toJson());

class ProfileData {
    ProfileData({
        this.error,
        this.data,
    });

    bool? error;
    Data? data;

    factory ProfileData.fromJson(Map<String, dynamic> json) => ProfileData(
        error: json["error"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "error": error,
        "data": data!.toJson(),
    };
}

class Data {
    Data({
        this.id,
        this.name,
        this.email,
        this.number,
        this.gender,
        this.birthdate,
        this.city,
        this.location,
        this.prefer,
        this.createdAt,
        this.updatedAt,
    });

    int? id;
    String? name;
    String?email;
    String? number;
    String? gender;
    String? birthdate;
    String? city;
    String? location;
    String? prefer;
    DateTime? createdAt;
    DateTime? updatedAt;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        number: json["number"],
        gender: json["gender"],
        birthdate: json["birthdate"],
        city: json["city"],
        location: json["location"],
        prefer: json["prefer"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "number": number,
        "gender": gender,
        "birthdate": birthdate,
        "city": city,
        "location": location,
        "prefer": prefer,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
    };
}
