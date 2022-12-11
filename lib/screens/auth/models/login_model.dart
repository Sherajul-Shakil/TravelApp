// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.status,
    this.message,
    this.token,
    this.userImfo,
  });

  bool? status;
  String? message;
  String? token;
  UserImfo? userImfo;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json["status"],
        message: json["message"],
        token: json["token"],
        userImfo: UserImfo.fromJson(json["user_imfo"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "token": token,
        "user_imfo": userImfo!.toJson(),
      };

  @override
  String toString() {
    return 'LoginModel{status: $status, message: $message, token: $token, userImfo: $userImfo}';
  }
}

class UserImfo {
  UserImfo({
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
  });

  int? id;
  String? name;
  String? email;
  String? mobileNumber;
  String? gender;
  String? birthDate;
  String? city;
  dynamic location;
  String? prefer;
  String? profilePic;
  String? affiliateId;

  factory UserImfo.fromJson(Map<String, dynamic> json) => UserImfo(
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
      };

  @override
  String toString() {
    return 'UserImfo{id: $id, name: $name, email: $email, mobileNumber: $mobileNumber  }';
  }
}
