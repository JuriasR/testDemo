import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tododemo/app/modules/login/login_controller.dart';

class LoginPage extends StatelessWidget {
  final controller = Get.put(LoginController());
  BuildContext _context;

  @override
  Widget build(BuildContext context) {
    _context = context;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: GetBuilder<LoginController>(
      init: LoginController(),
      builder: (_) {
        return SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Container(
              height: _height * .8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  _eMailInput(),
                  SizedBox(
                    height: 20,
                  ),
                  _passwordInput(),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(height: 10),
                  _buttonWidget(),
                ],
              ),
            ),
          ),
        );
      },
    ));
  }

  Widget _buttonWidget() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: ElevatedButton(
          onPressed: _iniciaSesion,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 80, vertical: 5),
            child: Text('Ingresar'),
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.blueAccent,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            elevation: 0,
          )),
    );
  }

  Widget _eMailInput() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: TextFormField(
          onChanged: (valor) {
            // _userModel.celular = valor;
            // initialValue: _userModel.celular,
          },
          controller: controller.emailController,
          maxLength: 150,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'Correo',
            icon: Icon(Icons.account_circle),
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

  Widget _passwordInput() {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: TextFormField(
          obscureText: true,
          controller: controller.passwordController,
          maxLength: 150,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            labelText: 'Contraseña',
            icon: Icon(Icons.account_circle),
          ),
          validator: (valor) {
            int _length = valor?.length ?? 0;
            if (_length < 4) {
              return 'Ingrese una contraseña válida.';
            } else {
              return null;
            }
          },
        ));
  }

  _iniciaSesion() {
    controller.authLogin(_context);
  }
}
