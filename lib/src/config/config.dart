import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

final String loginUrl = DotEnv.env['LOGIN_URL'];
final String registerUrl = DotEnv.env['REGISTER_URL'];
final String getCargaURL = DotEnv.env['CARGA_URL'];
final String xAPIKey = DotEnv.env['API_KEY'];
final String updateUserUrl = DotEnv.env['UPDATE_USER_URL'];
final String updateStatusUrl = DotEnv.env['UPDATE_STATUS_URL'];
