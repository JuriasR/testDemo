import 'package:get/route_manager.dart';
import 'package:tododemo/app/modules/add/add_page.dart';
import 'package:tododemo/app/modules/list/list_page.dart';
import 'package:tododemo/app/modules/login/login_page.dart';

routes() => [
      GetPage(name: 'login', page: () => LoginPage()),
      GetPage(name: 'list', page: () => ListPage()),
      GetPage(name: 'add', page: () => AddPage())
    ];
