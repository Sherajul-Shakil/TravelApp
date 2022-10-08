import 'package:hive_flutter/hive_flutter.dart';

import '../Model/profiledata.dart';
import 'package:http/http.dart' as http;

class Httpprofile {
  var box = Hive.box('user');
  Future<ProfileData?> getprofile() async {
    var headers = {'Authorization': 'Bearer ${box.get('token')}'};
    var request = http.Request(
        'GET', Uri.parse('https://travels.dd.limited/public/api/profile'));

    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      return profileDataFromJson(responsedata.body);
    } else {
      print(response.reasonPhrase);
    }
  }
}
