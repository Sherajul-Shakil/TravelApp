// To parse this JSON data, do
//
//     final registerModel = registerModelFromJson(jsonString);

import 'dart:convert';

RegisterModel registerModelFromJson(String str) =>
    RegisterModel.fromJson(json.decode(str));

String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  RegisterModel({
    this.status,
    this.message,
    this.token,
    this.userInfo,
  });

  bool? status;
  String? message;
  String? token;
  UserInfo? userInfo;

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        status: json["status"],
        message: json["message"],
        token: json["token"],
        userInfo: UserInfo.fromJson(json["user_info"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "token": token,
        "user_info": userInfo!.toJson(),
      };

  @override
  String toString() {
    return 'RegisterModel{status: $status, message: $message, token: $token, userInfo: $userInfo}';
  }
}

class UserInfo {
  UserInfo({
    this.name,
    this.email,
    this.mobileNumber,
    this.gender,
    this.birthDate,
    this.city,
    this.location,
    this.prefer,
    this.profilePic,
    this.id,
  });

  String? name;
  String? email;
  String? mobileNumber;
  String? gender;
  String? birthDate;
  String? city;
  String? location;
  String? prefer;
  String? profilePic;
  int? id;

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
        name: json["name"],
        email: json["email"],
        mobileNumber: json["mobile_number"],
        gender: json["gender"],
        birthDate: json["birth_date"],
        city: json["city"],
        location: json["location"],
        prefer: json["prefer"],
        profilePic: json["profile_pic"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "mobile_number": mobileNumber,
        "gender": gender,
        "birth_date": birthDate,
        "city": city,
        "location": location,
        "prefer": prefer,
        "profile_pic": profilePic,
        "id": id,
      };

  @override
  String toString() {
    return 'UserInfo{name: $name, email: $email, mobileNumber: $mobileNumber  }';
  }
}
