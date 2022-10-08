import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

import '../Toast/toast.dart';
import '../constant.dart';
import '../screens/home/home.dart';
import '../screens/navigation.dart';

class HttpForm {
  var box = Hive.box('user');

  Future registation(
      {name,
      email,
      number,
      gender,
      birthday,
      city,
      location,
      prefer,
      password,
      BuildContext? context}) async {
    var headers = {'Content-Type': 'application/json'};
    var request =
        http.Request('POST', Uri.parse(baseurl + '/api/registration'));
    request.body = json.encode({
      "name": name,
      "email": email,
      "number": number,
      "gender": gender,
      "birthdate": birthday,
      "city": city,
      "location": location,
      "prefer": prefer,
      "password": password
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);
    var jsondata = jsonDecode(responsedata.body);
    if (jsondata['message'] == "Registration Successfully") {
      box.put('token', jsondata['Token']);
      Navigator.pushAndRemoveUntil(
          context!,
          MaterialPageRoute(builder: ((context) => NavigationScreen())),
          (route) => false);
    }
    success(message: jsondata['message']);
  }

  Future login({email, password, BuildContext? context}) async {
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('POST', Uri.parse('$baseurl/api/login'));
    request.body = json.encode({"email": email, "password": password});
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);
    log(responsedata.toString());
    var jsondata = jsonDecode(responsedata.body);

    if (jsondata['message'] == "User Logged In Successfully") {
      box.put('token', jsondata['Token']);
      Navigator.pushAndRemoveUntil(
          context!,
          MaterialPageRoute(builder: ((context) => NavigationScreen())),
          (route) => false);
    }
    success(message: jsondata['message']);
  }
}
