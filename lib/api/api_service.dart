import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:moviesapi/model/Login_model.dart';

class Apiservice {
  Future<Loginresponsemodel> login(Loginrequestmodel requestmodel) async {
    final String url = "https://reqres.in/api/login";
    final response = await http.post(url, body: requestmodel.tojson());

    if (response.statusCode == 200 || response.statusCode == 400) {
      return Loginresponsemodel.fromjson(json.decode(response.body));
    } else {
      throw Exception('faild to load data');
    }
  }
}
