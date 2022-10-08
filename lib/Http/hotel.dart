import '../Model/hotelroom.dart';
import '../Model/hotels.dart';
import 'package:http/http.dart' as http;

import '../Model/hotelsearchmoel.dart';
import '../constant.dart';

class Httphotel {
  Future<Hotels?> gethotel() async {
    var request = http.Request('GET', Uri.parse(baseurl + '/api/hotels'));

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    return hotelsFromJson(responsedata.body);
  }

  Future<HotelsearchModel?> searchhotel({String? area}) async {
    var request =
        http.Request('GET', Uri.parse('$baseurl/api/locations/$area'));

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      return hotelsearchModelFromJson(responsedata.body);
    } else {
      print(response.reasonPhrase);
    }
  }

  Future<HotelRoom?> gethotelroom({hotelid}) async {
    var request =
        http.Request('GET', Uri.parse('$baseurl/api/hotels/$hotelid'));

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      return hotelRoomFromJson(responsedata.body);
    } else {
      print(response.reasonPhrase);
    }
  }
}
