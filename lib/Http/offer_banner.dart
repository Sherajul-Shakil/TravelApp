import 'package:http/http.dart' as http;

import '../Model/offerbanner.dart';

class HttpOfferBanner {
  Future<Offerbanner> getofferbanner() async {
    var request = http.Request('GET',
        Uri.parse('http://bdtravel.jonylawschool.com/public/api/offer_banner'));

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);
    return offerbannerFromJson(responsedata.body);
  }
}
