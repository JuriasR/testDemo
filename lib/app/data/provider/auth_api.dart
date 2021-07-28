import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:tododemo/app/core/values/strings.dart';
import 'package:http/http.dart' as http;
import 'package:tododemo/app/data/provider/user_preferences.dart';

class AuthApi {
  Future<bool> login(BuildContext context,
      {@required String email, @required String password}) async {
    try {
      final prefs = PreferenciasUsuario();
      final url = AppConfig.apiHost + 'auth/local';
      final body = {"identifier": email, "password": password};

      final response = await http.post(Uri.parse(url), body: body);

      final parsed = jsonDecode(response.body);

      if (response.statusCode == 200) {
        final token = parsed['jwt'];
        prefs.token = token;
        prefs.id = parsed['user']['id'];
        prefs.userName = parsed['user']['username'];
        prefs.correo = parsed['user']['email'];
        Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
        prefs.expiraToken = decodedToken['exp'];
        return true;
        // final email = parsed['user']['id'];
        // final email = parsed['user']['id'];
      } else {
        throw PlatformException(code: '400', message: parsed['message']);
      }
    } catch (e) {
      return false;
    }
  }
}
