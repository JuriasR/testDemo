import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {
  static final PreferenciasUsuario _instancia =
      new PreferenciasUsuario._internal();

  factory PreferenciasUsuario() {
    return _instancia;
  }

  PreferenciasUsuario._internal();

  SharedPreferences _prefs;

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  // GET y SET del id
  int get id {
    return _prefs.getInt('id') ?? 0;
  }

  set id(int value) {
    _prefs.setInt('id', value);
  }

  // GET y SET del token
  String get token {
    return _prefs.getString('token') ?? '';
  }

  set token(String value) {
    _prefs.setString('token', value);
  }

  // GET y SET del correo
  String get correo {
    return _prefs.getString('correo') ?? '';
  }

  set correo(String value) {
    _prefs.setString('correo', value);
  }

  // GET y SET del userName
  String get userName {
    return _prefs.getString('userName') ?? '';
  }

  set userName(String value) {
    _prefs.setString('userName', value);
  }

  // GET y SET del role
  int get role {
    return _prefs.getInt('role') ?? 0;
  }

  set role(int value) {
    _prefs.setInt('role', value);
  }

  // GET y SET del role
  int get expiraToken {
    return _prefs.getInt('expiraToken') ?? 0;
  }

  set expiraToken(int value) {
    _prefs.setInt('expiraToken', value);
  }
}
