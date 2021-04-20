import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:itlstatusb/src/models/user.dart';
import 'package:itlstatusb/src/models/status_model.dart';
import 'package:itlstatusb/src/config/config.dart';

class APIService {
  static Future<User> doLogin(email, password) async {
    var result = await http.post(loginUrl,
        body: {'login': email, 'password': password},
        headers: {'X-API': xAPIKey});
    if (result.statusCode >= 300) return null;
    var jsonResponse = convert.jsonDecode(result.body)['data'];
    jsonResponse['expiresAt'] = DateTime.now().toUtc().millisecondsSinceEpoch;
    User user = User.fromData(jsonResponse);
    return user;
    // return result;
  }

  static Future<User> doRegister(username, email, password) async {
    var result = await http.post(registerUrl,
        body: {'username': username, 'login': email, 'password': password},
        headers: {'X-API': xAPIKey});
    if (result.statusCode >= 300) return null;
    var jsonResponse = convert.jsonDecode(result.body)['data'];
    jsonResponse['expiresAt'] = DateTime.now().toUtc().millisecondsSinceEpoch;
    User user = User.fromData(jsonResponse);
    return user;
    // return result;
  }

  static Future<Status> getStatus(User user) async {
    Map<String, String> queryParams = {
      "id": user.id,
      "sessionId": user.sessionId
    };
    String queryString =
        getCargaURL + '?' + Uri(queryParameters: queryParams).query;
    var result = await http.get(queryString, headers: {'X-API': xAPIKey});

    if (result.statusCode >= 300) return null;
    var jsonResponse = convert.jsonDecode(result.body)['data'];

    Status status = Status.fromData(jsonResponse);
    return status;
  }
}
