import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tododemo/app/data/model/lista.dart';
import 'package:tododemo/app/modules/add/add_controller.dart';

class AddPage extends StatelessWidget {
  final controller = Get.put(AddController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Nueva lista'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _inputLista(),
              _botones(context),
            ],
          ),
        ));
  }

  Widget _botones(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(child: _crearBotonCancelar(context)),
            Expanded(child: _crearBoton()),
          ],
        ));
  }

  Widget _crearBoton() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: ElevatedButton.icon(
          icon: Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
            controller.addLista(
                Lista(name: controller.nameController.text, estatus: false));
          },
          label: Text('Agregar'),
          style: ElevatedButton.styleFrom(
            primary: Colors.green,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            elevation: 0,
          )),
    );
  }

  Widget _crearBotonCancelar(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: ElevatedButton.icon(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          label: Text('Cancelar'),
          style: ElevatedButton.styleFrom(
            primary: Colors.red,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            elevation: 0,
          )),
    );
  }

  Widget _inputLista() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: TextFormField(
          controller: controller.nameController,
          maxLength: 100,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            labelText: 'Lista',
            icon: Icon(
              Icons.list,
              color: Colors.blueAccent,
            ),
          ),
          validator: (valor) {
            int _length = valor?.length ?? 0;
            if (_length < 10) {
              return 'Ingrese un celular correcto.';
            } else {
              return null;
            }
          },
        ));
  }
}
