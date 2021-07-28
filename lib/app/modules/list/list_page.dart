import 'package:flutter/material.dart';
import 'package:tododemo/app/data/model/lista.dart';
import 'package:tododemo/app/data/provider/user_preferences.dart';
import 'package:tododemo/app/modules/list/list_controller.dart';
import 'package:get/get.dart';
import 'package:tododemo/app/modules/login/login_page.dart';

class ListPage extends StatelessWidget {
  final prefs = PreferenciasUsuario();
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ListController());
    return Scaffold(
      appBar: AppBar(
        title: Text('Mis listas'),
        actions: [
          IconButton(
            tooltip: "Cerrar sesión",
            icon: Icon(Icons.logout),
            onPressed: () {
              prefs.token = '';
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('login', (route) => false);
            },
          )
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ListView.separated(
              itemBuilder: (context, index) => ListTile(
                    title: Text(controller.listas[index].name,
                        style: (controller.listas[index].estatus)
                            ? TextStyle(
                                color: Colors.red,
                                decoration: TextDecoration.lineThrough)
                            : TextStyle(color: Colors.blueAccent)),
                    onLongPress: () async {
                      bool result = await controller
                          .removeLista(Lista(id: controller.listas[index].id));
                    },
                    trailing: Checkbox(
                      value: controller.listas[index].estatus,
                      onChanged: (v) {
                        controller.updateLista(Lista(
                            id: controller.listas[index].id,
                            name: controller.listas[index].name,
                            estatus: v));
                        var changed = controller.listas[index];
                        changed.estatus = v;
                        controller.listas[index] = changed;
                      },
                    ),
                  ),
              separatorBuilder: (_, __) => Divider(),
              itemCount: controller.listas.length);
        }
      }),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.pushNamed(context, 'add');
        },
      ),
    );
  }
}
