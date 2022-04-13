import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/fcats_model.dart';

class Services {
  Future<CatFact?> connectToAPI() async {
    String apiURL = 'https://catfact.ninja/fact';

    try {
      var apiResult = await http
          .get(Uri.parse(apiURL))
          .timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException('connection timeout, try again');
      });

      if (apiResult.statusCode == 200) {
        var jsonObject = json.decode(apiResult.body);
        return CatFact.throwFact(jsonObject);
      } else {
        return null;
      }
    } on TimeoutException catch (_) {
      print('response time out');
    }
  }
}
