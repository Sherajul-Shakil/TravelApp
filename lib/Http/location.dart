import '../Model/currentlocation.dart';
import 'package:http/http.dart' as http;

import '../Model/nearbyplace.dart';

class HttpLocation {
  Future<Currentlocation?> getlocationdata() async {
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://barikoi.xyz/v1/api/search/reverse/Mzg4Njo0MklUM040SVJL/geocode?longitude=90.4066082&latitude=23.7936706&district=true&post_code=true&country=true&sub_district=true&union=true&pauroshova=true&location_type=true&division=true&address=true&area=true&bangla=true'));

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      return currentlocationFromJson(responsedata.body);
    } else {
      print(response.reasonPhrase);
    }
  }

  Future<Nearbyplace?> getnearlocation() async {
    var request = http.Request(
        'GET',
        Uri.parse(
            'https://barikoi.xyz/v2/api/search/nearby/Mzg4Njo0MklUM040SVJL/0.5/10?longitude=90.36668110638857&latitude=23.83723803415923'));

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      return nearbyplaceFromJson(responsedata.body);
    } else {
      print(response.reasonPhrase);
    }
  }
}
