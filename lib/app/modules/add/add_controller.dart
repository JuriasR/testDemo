import 'package:get/state_manager.dart';
import 'package:tododemo/app/data/provider/api_listas.dart';
import 'package:tododemo/app/data/model/lista.dart';
import 'package:flutter/material.dart';

class AddController extends GetxController {
  final _listaApi = ListaApi();
  final nameController = TextEditingController();

  addLista(Lista lista) {
    try {
      _listaApi.addLista(lista);
    } catch (e) {}
  }
}
