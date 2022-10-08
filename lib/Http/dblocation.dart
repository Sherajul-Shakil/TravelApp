

import '../Model/dblocation.dart';
import 'package:http/http.dart' as http;

import '../constant.dart';

class HttpDblocation {
  Future<DbLocation?> getdblocation() async {
    var request = http.Request('GET', Uri.parse('$baseurl/api/locations'));

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    if (response.statusCode == 200) {
      return dbLocationFromJson(responsedata.body);
    } else {
      print(response.reasonPhrase);
    }
  }
}
