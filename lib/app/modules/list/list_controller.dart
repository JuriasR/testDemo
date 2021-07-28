import 'package:get/state_manager.dart';
import 'package:tododemo/app/data/model/lista.dart';
import 'package:tododemo/app/data/provider/api_listas.dart';

class ListController extends GetxController {
  // ignore: deprecated_member_use
  var listas = List<Lista>().obs;
  final _listaApi = ListaApi();
  var isLoading = false.obs;
  int get count => listas.length;
  @override
  void onInit() {
    getListas();
    super.onInit();
  }

  getListas() async {
    try {
      isLoading(true);
      var result = await _listaApi.getListas();
      listas.value = result;
      // return lst;
    } finally {
      isLoading(false);
    }
  }

  removeLista(Lista lista) async {
    try {
      bool result = await _listaApi.removeLista(lista);
      if (result) {
        getListas();
      }
    } catch (e) {}
  }

  updateLista(Lista lista) async {
    try {
      bool result = await _listaApi.updateLista(lista);
      if (result) {
        getListas();
      }
    } catch (e) {}
  }
}
