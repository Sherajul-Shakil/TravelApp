

import '../Model/category.dart';
import 'package:http/http.dart' as http;

import '../constant.dart';

class HttpCategory {
  Future<Category?> getcategory() async {
    var request = http.Request('GET', Uri.parse(baseurl + '/api/category'));

    http.StreamedResponse response = await request.send();
    var responsedata = await http.Response.fromStream(response);

    return categoryFromJson(responsedata.body);
  }
}
