import 'dart:convert';

import 'package:http/http.dart';

import '../../Models/Auth/user.dart';
import '../../Utils/api_urls.dart';

class LoginApi {
  static const String baseUrl = ApiURL.LOGIN;

  Future<UserInfo> login(String email, String password) async {
    try {
      final Uri url = Uri.parse(baseUrl);

      // Prepare the request body
      final Map<String, String> body = {
        'email': email,
        'password': password,
      };
      final Response response = await post(url, body: body);
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        final UserInfo userInfo = UserInfo.fromJson(data);
        return userInfo;
      } else {
        throw Exception('Login Failed. ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Internal Server Error');
    }
  }
}
