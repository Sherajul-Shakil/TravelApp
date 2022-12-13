// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.success,
    this.token,
    this.data,
    this.message,
  });

  bool? success;
  String? token;
  Data? data;
  String? message;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        success: json["success"],
        token: json["token"],
        data: Data.fromJson(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "token": token,
        "data": data!.toJson(),
        "message": message,
      };

  @override
  String toString() {
    return 'LoginModel{success: $success, token: $token, data: $data, message: $message}';
  }
}

class Data {
  Data({
    this.id,
    this.name,
    this.email,
    this.mobileNumber,
    this.gender,
    this.birthDate,
    this.city,
    this.location,
    this.prefer,
    this.profilePic,
    this.affiliateId,
    this.status,
  });

  int? id;
  String? name;
  String? email;
  String? mobileNumber;
  String? gender;
  String? birthDate;
  String? city;
  String? location;
  String? prefer;
  String? profilePic;
  String? affiliateId;
  String? status;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        mobileNumber: json["mobile_number"],
        gender: json["gender"],
        birthDate: json["birth_date"],
        city: json["city"],
        location: json["location"],
        prefer: json["prefer"],
        profilePic: json["profile_pic"],
        affiliateId: json["affiliate_id"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "mobile_number": mobileNumber,
        "gender": gender,
        "birth_date": birthDate,
        "city": city,
        "location": location,
        "prefer": prefer,
        "profile_pic": profilePic,
        "affiliate_id": affiliateId,
        "status": status,
      };

  @override
  String toString() {
    return 'Data{id: $id, name: $name, email: $email, mobileNumber: $mobileNumber }';
  }
}
