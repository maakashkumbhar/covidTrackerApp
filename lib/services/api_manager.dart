import 'dart:convert';

import 'package:covidtracker/constants/strings.dart';
import 'package:covidtracker/models/global_model.dart';
import 'package:http/http.dart' as http;

class Api_Manager {
  var _client = http.Client();
  var _model = null;

  Future<Welcome> getGlobalData() async {
    try {
      var response = await _client.get(Uri.parse(Strings().globalUrl));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = jsonDecode(jsonString);

        _model = Welcome.fromJson(jsonMap);
      }
    } catch (e) {
      print(e);
    }

    return _model;
  }
}
