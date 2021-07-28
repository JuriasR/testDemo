import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:tododemo/app/data/provider/auth_api.dart';
import 'package:tododemo/app/global_widgets/dialogs_widgets.dart';

class LoginController extends GetxController {
  BuildContext context;
  Function onRefresh;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _authApi = AuthApi();
  Future init(BuildContext context, Function onRefresh) async {
    this.context = context;
    this.onRefresh = onRefresh;
  }

  void authLogin(BuildContext context) async {
    final isValid = formKey.currentState.validate();

    if (isValid) {
      Dialogs.showLoaderDialog(context, 'Iniciando Sesión...');
      final isOk = await _authApi.login(context,
          email: emailController.text, password: passwordController.text);
      Navigator.pop(context);
      if (isOk) {
        Navigator.popAndPushNamed(context, 'list');
      } else {}
    } else {}
    print(emailController.text);
    print(passwordController.text);
  }
}
