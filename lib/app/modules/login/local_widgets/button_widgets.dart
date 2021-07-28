import 'package:flutter/material.dart';

class ButtonWidget {
  Widget crearBoton(Function _onPressed, Color _color) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: ElevatedButton(
          onPressed: _onPressed,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 80, vertical: 5),
            child: Text('Ingresar'),
          ),
          style: ElevatedButton.styleFrom(
            primary: _color,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            elevation: 0,
          )),
    );
  }
}
