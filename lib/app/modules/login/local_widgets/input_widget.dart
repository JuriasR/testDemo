import 'package:flutter/material.dart';

class InputWidget {
  Widget input(TextEditingController _controller, TextInputType _textInputType,
      String _label, String _returnTexto, Icon _icon,
      {int maxLength = 50, bool obscureText = false, Function validator}) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: TextFormField(
          onChanged: (valor) {
            // _userModel.celular = valor;
            // initialValue: _userModel.celular,
          },
          obscureText: obscureText,
          controller: _controller,
          maxLength: maxLength,
          keyboardType: _textInputType,
          decoration: InputDecoration(
            labelText: _label,
            icon: _icon,
          ),
          validator: validator,
        ));
  }
}
