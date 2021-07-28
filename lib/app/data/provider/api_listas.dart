import 'dart:convert';

import 'package:tododemo/app/core/values/strings.dart';
import 'package:tododemo/app/data/model/lista.dart';
import 'package:tododemo/app/data/provider/user_preferences.dart';
import 'package:http/http.dart' as http;

class ListaApi {
  final prefs = PreferenciasUsuario();
  Future<List<Lista>> getListas() async {
    try {
      List<Lista> _lista = [];
      final url = AppConfig.apiHost + 'listas';
      final header = {"Authorization": "Bearer " + prefs.token};

      final response = await http.get(Uri.parse(url), headers: header);

      final parsed = jsonDecode(response.body);

      if (response.statusCode == 200) {
        var jsonBody = jsonDecode(response.body);

        for (var noteJson in jsonBody) {
          var lst = Lista.fromJson(noteJson);
          _lista.add(lst);
        }
        return _lista;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  Future<bool> addLista(Lista lista) async {
    try {
      print(lista.name);
      final url = AppConfig.apiHost + 'listas';
      final header = {"Authorization": "Bearer " + prefs.token};
      final bodyJson = json
          .encode({"name": lista.name, "estatus": lista.estatus, "uid": "uid"});
      print(bodyJson);
      final response =
          await http.post(Uri.parse(url), headers: header, body: bodyJson);

      final parsed = jsonDecode(response.body);

      if (response.statusCode == 200) {
        var jsonBody = jsonDecode(response.body);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<bool> removeLista(Lista lista) async {
    try {
      print(lista.name);
      final url = AppConfig.apiHost + 'listas/' + lista.id.toString();
      final header = {"Authorization": "Bearer " + prefs.token};
      final response = await http.delete(Uri.parse(url), headers: header);

      final parsed = jsonDecode(response.body);

      if (response.statusCode == 200) {
        var jsonBody = jsonDecode(response.body);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> updateLista(Lista lista) async {
    try {
      print(lista.name);
      final url = AppConfig.apiHost + 'listas/' + lista.id.toString();
      final header = {"Authorization": "Bearer " + prefs.token};

      // final bodyJson = lista.toJson();

      final bodyJson = json.encode(
          {"id": lista.id, "name": lista.name, "estatus": lista.estatus});
      final response =
          await http.put(Uri.parse(url), headers: header, body: bodyJson);
      final parsed = jsonDecode(response.body);

      if (response.statusCode == 200) {
        var jsonBody = jsonDecode(response.body);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}
