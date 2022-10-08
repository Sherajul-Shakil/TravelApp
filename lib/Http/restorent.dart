import 'package:http/http.dart' as http;

import '../Model/hotelsearchmoel.dart';
import '../Model/restorentmodel.dart';
import '../Model/resturant_menu.dart';
import '../Model/resturant_offer.dart';
import '../constant.dart';

class Httprestorent {
  Future<RestorentModel?> getrestorent() async {
    var request = http.Request('GET', Uri.parse('$baseurl/api/restaurants'));

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    return restorentModelFromJson(responsedata.body);
  }

  Future<Resturantoffer?> resturentoffer() async {
    var request = http.Request('GET',
        Uri.parse('https://travels.dd.limited/public/api/restaurants/offer'));

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      return resturantofferFromJson(responsedata.body);
    } else {
      print(response.reasonPhrase);
    }
  }

  Future<ResturantMenu?> resturentmenu({resturentid}) async {
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://travels.dd.limited/public/api/restaurants/menus/$resturentid'));

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      return resturantMenuFromJson(responsedata.body);
    } else {
      print(response.reasonPhrase);
    }
  }
}
