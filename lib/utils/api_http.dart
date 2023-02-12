import 'dart:convert';

import 'package:http/http.dart' as http;

import '../home/model/homemodel.dart';

class Api_http {
  Future<Homemodel?> weatherdata(String city) async {
    String link =
        "https://api.openweathermap.org/data/2.5/weather?q=$city,IN&appid=1177b1e3edcc54bc767e02d9b9806249";
    var response = await http.get(Uri.parse(link));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      Homemodel h1 = Homemodel.fromJson(json);
      return h1;
    }
    return null;
  }
}
