import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/activity_model.dart';

class Services {
  Future<ActivityIdea?> connectToAPI() async {
    String apiURL = 'https://www.boredapi.com/api/activity';

    try {
      var apiResult = await http
          .get(Uri.parse(apiURL))
          .timeout(const Duration(seconds: 10), onTimeout: () {
        throw TimeoutException('connection timeout, try again');
      });

      if (apiResult.statusCode == 200) {
        var jsonObject = json.decode(apiResult.body);
        return ActivityIdea.fromJson(jsonObject);
      } else {
        return null;
      }
    } on TimeoutException catch (_) {
      print('response time out');
    }
  }
}
