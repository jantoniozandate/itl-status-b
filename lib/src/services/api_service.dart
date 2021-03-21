import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:itlstatusb/src/models/user.dart';
import 'package:itlstatusb/src/config/config.dart';

Future<User> doLogin(email, password) async {
  var result = await http.post(loginUrl, body: {
    'login': email,
    'password': password
  }, headers: {'X-API': xAPIKey});
  var jsonResponse = convert.jsonDecode(result.body)['data'];
  User user = User.fromData(jsonResponse);
  return user;
  // return result;
}
